class ReviewParser
  REVIEW_API = "https://www.walmart.com/terra-firma/item/%s/reviews?showProduct=false&sort=relevancy&filters=&page=%s&limit=%s"
  REVIEW_WEB = "https://www.walmart.com/reviews/product/%s"
  DEFAULT_PAGE_QWT = 1
  DEFAULT_REVIEWS_PER_PAGE = 20

  def initialize(product_id)
    @product_id = product_id
    @review_web = REVIEW_WEB % product_id
    doc = Nokogiri::HTML(open(@review_web))
    @pages = doc.css('.paginator-list li a').to_a.last.content.to_i rescue DEFAULT_PAGE_QWT
    @reviews_per_page = doc.css('.review-stats span').first.content.match(/\d-(\d+)/)[1] rescue DEFAULT_REVIEWS_PER_PAGE
  end

  def parse(page_number = 1)
    return [] if page_number > @pages
    response = HTTParty.get(REVIEW_API % [@product_id, page_number, @reviews_per_page])
    response
      .parsed_response['payload']['customerReviews']
      .map{|r| {
          user_name: r['userNickname'], 
          body: r['reviewText'] 
        }
      } + parse(page_number + 1)
  end
end
