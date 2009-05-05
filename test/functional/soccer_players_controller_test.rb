require 'test_helper'

class SoccerPlayersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soccer_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soccer_player" do
    assert_difference('SoccerPlayer.count') do
      post :create, :soccer_player => { }
    end

    assert_redirected_to soccer_player_path(assigns(:soccer_player))
  end

  test "should show soccer_player" do
    get :show, :id => soccer_players(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => soccer_players(:one).to_param
    assert_response :success
  end

  test "should update soccer_player" do
    put :update, :id => soccer_players(:one).to_param, :soccer_player => { }
    assert_redirected_to soccer_player_path(assigns(:soccer_player))
  end

  test "should destroy soccer_player" do
    assert_difference('SoccerPlayer.count', -1) do
      delete :destroy, :id => soccer_players(:one).to_param
    end

    assert_redirected_to soccer_players_path
  end
end
