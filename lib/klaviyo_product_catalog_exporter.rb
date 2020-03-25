class KlaviyoProductCatalogExporter < ProductCatalogExporter
  def process!
    super
  end

  def format_csv(product)
    ProductKlaviyoPresenter.new(product).as_json
  end

  def send_notify_emails(job); end

  def self.run
    KlaviyoProductCatalogExporter.new(method, headers).process!
  end

  def self.headers
    %w[id title link description price image_link categories].freeze
  end

  def self.method
    "Klaviyo"
  end
end
