class PodcastsSpider < Kimurai::Base

  @name = 'podcasts_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    podcastList = []
    response.css('div.span3').each do |podcastTitle|
      item = {}

      item[:title] = podcastTitle.css('strong.tit')&.text&.squish
      item[:image_url] = podcastTitle.css('img.lazyload').attr('data-src')&.text&.squish

      podcastList.append(item)
    end
    podcastList.pop
    podcastList.each do |podcast|
      Podcastscrapping.where(podcast).first_or_create
    end
  end
end