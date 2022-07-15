class PodcastscrappingsController < ApplicationController
  before_action :set_podcastscrapping, only: %i[ show edit update destroy ]

  def index
  end

  def scrape
    url = 'https://www.podbean.com/science-podcasts'
    response = PodcastsSpider.process(url)
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcastscrapping
      @podcastscrapping = Podcastscrapping.find(params[:id])
    end

    def podcastscrapping_params
      params.require(:podcastscrapping).permit(:title)
    end
end
