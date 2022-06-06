require "application_system_test_case"

class PodcastListsTest < ApplicationSystemTestCase
  setup do
    @podcast_list = podcast_lists(:one)
  end

  test "visiting the index" do
    visit podcast_lists_url
    assert_selector "h1", text: "Podcast lists"
  end

  test "should create podcast list" do
    visit podcast_lists_url
    click_on "New podcast list"

    fill_in "Title", with: @podcast_list.title
    click_on "Create Podcast list"

    assert_text "Podcast list was successfully created"
    click_on "Back"
  end

  test "should update Podcast list" do
    visit podcast_list_url(@podcast_list)
    click_on "Edit this podcast list", match: :first

    fill_in "Title", with: @podcast_list.title
    click_on "Update Podcast list"

    assert_text "Podcast list was successfully updated"
    click_on "Back"
  end

  test "should destroy Podcast list" do
    visit podcast_list_url(@podcast_list)
    click_on "Destroy this podcast list", match: :first

    assert_text "Podcast list was successfully destroyed"
  end
end
