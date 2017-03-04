require 'test_helper'

class SonuEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sonu_event = sonu_events(:one)
  end

  test "should get index" do
    get sonu_events_url
    assert_response :success
  end

  test "should get new" do
    get new_sonu_event_url
    assert_response :success
  end

  test "should create sonu_event" do
    assert_difference('SonuEvent.count') do
      post sonu_events_url, params: { sonu_event: { info: @sonu_event.info, name: @sonu_event.name } }
    end

    assert_redirected_to sonu_event_url(SonuEvent.last)
  end

  test "should show sonu_event" do
    get sonu_event_url(@sonu_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_sonu_event_url(@sonu_event)
    assert_response :success
  end

  test "should update sonu_event" do
    patch sonu_event_url(@sonu_event), params: { sonu_event: { info: @sonu_event.info, name: @sonu_event.name } }
    assert_redirected_to sonu_event_url(@sonu_event)
  end

  test "should destroy sonu_event" do
    assert_difference('SonuEvent.count', -1) do
      delete sonu_event_url(@sonu_event)
    end

    assert_redirected_to sonu_events_url
  end
end
