require "test_helper"

class PodcastListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @podcast_list = podcast_lists(:one)
  end

  test "should get index" do
    get podcast_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_podcast_list_url
    assert_response :success
  end

  test "should create podcast_list" do
    assert_difference("PodcastList.count") do
      post podcast_lists_url, params: { podcast_list: { title: @podcast_list.title } }
    end

    assert_redirected_to podcast_list_url(PodcastList.last)
  end

  test "should show podcast_list" do
    get podcast_list_url(@podcast_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_podcast_list_url(@podcast_list)
    assert_response :success
  end

  test "should update podcast_list" do
    patch podcast_list_url(@podcast_list), params: { podcast_list: { title: @podcast_list.title } }
    assert_redirected_to podcast_list_url(@podcast_list)
  end

  test "should destroy podcast_list" do
    assert_difference("PodcastList.count", -1) do
      delete podcast_list_url(@podcast_list)
    end

    assert_redirected_to podcast_lists_url
  end
end
