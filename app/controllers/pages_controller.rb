class PagesController < ApplicationController
  def index
    @podcastscrappings = Podcastscrapping.all
  end
end
