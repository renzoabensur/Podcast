require "test_helper"

class PodcastscrappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @podcastscrapping = podcastscrappings(:one)
  end

  test "should get index" do
    get podcastscrappings_url
    assert_response :success
  end

  test "should get new" do
    get new_podcastscrapping_url
    assert_response :success
  end

  test "should create podcastscrapping" do
    assert_difference("Podcastscrapping.count") do
      post podcastscrappings_url, params: { podcastscrapping: { title: @podcastscrapping.title } }
    end

    assert_redirected_to podcastscrapping_url(Podcastscrapping.last)
  end

  test "should show podcastscrapping" do
    get podcastscrapping_url(@podcastscrapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_podcastscrapping_url(@podcastscrapping)
    assert_response :success
  end

  test "should update podcastscrapping" do
    patch podcastscrapping_url(@podcastscrapping), params: { podcastscrapping: { title: @podcastscrapping.title } }
    assert_redirected_to podcastscrapping_url(@podcastscrapping)
  end

  test "should destroy podcastscrapping" do
    assert_difference("Podcastscrapping.count", -1) do
      delete podcastscrapping_url(@podcastscrapping)
    end

    assert_redirected_to podcastscrappings_url
  end
end
