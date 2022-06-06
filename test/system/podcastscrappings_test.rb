require "application_system_test_case"

class PodcastscrappingsTest < ApplicationSystemTestCase
  setup do
    @podcastscrapping = podcastscrappings(:one)
  end

  test "visiting the index" do
    visit podcastscrappings_url
    assert_selector "h1", text: "Podcastscrappings"
  end

  test "should create podcastscrapping" do
    visit podcastscrappings_url
    click_on "New podcastscrapping"

    fill_in "Title", with: @podcastscrapping.title
    click_on "Create Podcastscrapping"

    assert_text "Podcastscrapping was successfully created"
    click_on "Back"
  end

  test "should update Podcastscrapping" do
    visit podcastscrapping_url(@podcastscrapping)
    click_on "Edit this podcastscrapping", match: :first

    fill_in "Title", with: @podcastscrapping.title
    click_on "Update Podcastscrapping"

    assert_text "Podcastscrapping was successfully updated"
    click_on "Back"
  end

  test "should destroy Podcastscrapping" do
    visit podcastscrapping_url(@podcastscrapping)
    click_on "Destroy this podcastscrapping", match: :first

    assert_text "Podcastscrapping was successfully destroyed"
  end
end
