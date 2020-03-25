class FacebookProductCatalogExporter < ProductCatalogExporter
  def process!
    super
  end

  def format_csv(product)
    ProductFacebookPresenter.new(product).as_json
  end

  def send_notify_emails(job)
    product_export_notify_emails = ENV["PRODUCT_EXPORT_NOTIFY_EMAILS"].split(",")
    product_export_notify_emails.each { |email| ExportProductMailer.notification(job.id, email).deliver_now }
  end

  def self.run
    FacebookProductCatalogExporter.new(method, headers).process!
  end

  def self.headers
    %w[id title description availability condition price link image_link brand].freeze
  end

  def self.method
    "Facebook"
  end
end
