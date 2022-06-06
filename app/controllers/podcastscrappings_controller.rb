class PodcastscrappingsController < ApplicationController
  before_action :set_podcastscrapping, only: %i[ show edit update destroy ]

  # GET /podcastscrappings or /podcastscrappings.json
  def index
    # binding.pry

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

  # GET /podcastscrappings/new
  def new
    @podcastscrapping = Podcastscrapping.new
  end

  # GET /podcastscrappings/1/edit
  def edit
  end

  # POST /podcastscrappings or /podcastscrappings.json
  def create
    @podcastscrapping = Podcastscrapping.new(podcastscrapping_params)

    respond_to do |format|
      if @podcastscrapping.save
        format.html { redirect_to podcastscrapping_url(@podcastscrapping), notice: "Podcastscrapping was successfully created." }
        format.json { render :show, status: :created, location: @podcastscrapping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @podcastscrapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcastscrappings/1 or /podcastscrappings/1.json
  def update
    respond_to do |format|
      if @podcastscrapping.update(podcastscrapping_params)
        format.html { redirect_to podcastscrapping_url(@podcastscrapping), notice: "Podcastscrapping was successfully updated." }
        format.json { render :show, status: :ok, location: @podcastscrapping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @podcastscrapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcastscrappings/1 or /podcastscrappings/1.json
  def destroy
    @podcastscrapping.destroy

    respond_to do |format|
      format.html { redirect_to podcastscrappings_url, notice: "Podcastscrapping was successfully destroyed." }
      format.json { head :no_content }
    end
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
