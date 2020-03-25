require "csv"

class ProductCatalogExporter
  attr_accessor :headers
  attr_accessor :method
  attr_accessor :default_batch_operation_size

  def initialize(method, headers)
    @method = method
    @headers = headers
    @default_batch_operation_size = 10_000
  end

  def process!
    filter_products

    (first_id..last_id).step(default_batch_operation_size).each do |step|
      process_step(step)
    end
  end

  private

  def filter_products
    @products = Product.marketplace.global.visible.available
  end

  def first_id
    Product.first.id
  end

  def last_id
    Product.last.id
  end

  def process_step(step)
    @job = ProductExportJob.find_or_initialize_by(
      file_name: "#{method}-#{Time.current.year}-#{Time.current.month}-#{Time.current.day}-#{step}-#{step + default_batch_operation_size}.csv",
      number_of_products: default_batch_operation_size,
    )

    @job.save!

    # cache data into temp file for aws upload
    CSV.open(buffer, "wb", write_headers: true, headers: headers) { |csv| generate(csv, step) }

    @job.upload(buffer, method)

    send_notify_emails(@job)
  ensure
    release_buffer
  end

  # tempfile for caching content
  def buffer
    @buffer ||= Tempfile.new("#{SecureRandom.hex(4)}.csv")
  end

  def release_buffer
    buffer.close
  end

  def generate(csv, start)
    limit = start + default_batch_operation_size

    @products.where(id: start..limit).select(:id, :name, :msrp_in_cents, :description).each do |product|
      next unless product.msrp_in_cents&.positive?

      json = format_csv(product)
      csv << headers.map { |attr| json[attr.to_sym] }
    end
  end

  def send_notify_emails(job)
    yield(job)
  end

  def format_csv(product)
    yield(product)
  end
end
