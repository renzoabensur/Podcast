class PodcastscrappingsController < ApplicationController
  before_action :set_podcastscrapping, only: %i[ show edit update destroy ]

  # GET /podcastscrappings or /podcastscrappings.json
  def index
    @podcastscrappings = Podcastscrapping.all
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

  # GET /podcastscrappings/1 or /podcastscrappings/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcastscrapping
      @podcastscrapping = Podcastscrapping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def podcastscrapping_params
      params.require(:podcastscrapping).permit(:title)
    end
end
