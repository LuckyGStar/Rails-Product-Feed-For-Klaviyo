require "csv"

class ResourceReader < Reader
  FIRST_ROW = 2

  KLAVIYO_PRODUCT_FEED_HEADERS = %w[id title link description price image_link categories].freeze

  # Main engine for analyse of excel file
  def run
    @payload = []

    parse do
      parse_csv
    end

    @payload
  end

  def read_cell(spreadsheet, row, attr)
    if attr == "categories"
      spreadsheet.cell(row, COLUMNS_HEADER[attr.to_sym]).split(",")
    else
      spreadsheet.cell(row, COLUMNS_HEADER[attr.to_sym])
    end
  end

  def parse_csv
    ss = CSV.parse(File.read(tmp_file_path), headers: true)

    ss.each do |row|
      product_hash = {}

      KLAVIYO_PRODUCT_FEED_HEADERS.each do |attr|
        product_hash[attr.to_sym] = row[attr]
      end

      @payload.push(product_hash)
    end
  end

  # initialize resource class
  def self.run(uploader_id)
    ResourceReader.new(uploader_id).run
  end
end
