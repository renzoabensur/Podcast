class PodcastsSpider < Kimurai::Base

  @name = 'podcasts_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    puts response
    puts ("oiii")
    puts response.css('strong.tit')

    response.css('strong.tit').each do |vehicle|
      puts vehicle.text&.squish
      
      item = {}

      item[:title]      = vehicle.text&.squish

      Podcastscrapping.where(item).first_or_create
    end
  end
end