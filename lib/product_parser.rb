require 'open-uri'

class ProductParser
  attr_reader :product_id

  def initialize(url)
    @url = url
    @product_id = url.split('/').last
  end

  def parse
    doc = Nokogiri::HTML(open(@url))
    {
      title: doc.css('.prod-ProductTitle > div').first.content,
      price: doc.css('.prod-PriceHero .display-inline-block-m span.Price-characteristic').first.attributes['content'].value.to_f
    }
  end
end