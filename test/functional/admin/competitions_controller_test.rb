require 'test_helper'

class Admin::CompetitionsControllerTest < ActionController::TestCase
  setup do
    @admin_competition = admin_competitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_competitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_competition" do
    assert_difference('Admin::Competition.count') do
      post :create, admin_competition: { max_age: @admin_competition.max_age, min_age: @admin_competition.min_age, name: @admin_competition.name, sex: @admin_competition.sex }
    end

    assert_redirected_to admin_competition_path(assigns(:admin_competition))
  end

  test "should show admin_competition" do
    get :show, id: @admin_competition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_competition
    assert_response :success
  end

  test "should update admin_competition" do
    put :update, id: @admin_competition, admin_competition: { max_age: @admin_competition.max_age, min_age: @admin_competition.min_age, name: @admin_competition.name, sex: @admin_competition.sex }
    assert_redirected_to admin_competition_path(assigns(:admin_competition))
  end

  test "should destroy admin_competition" do
    assert_difference('Admin::Competition.count', -1) do
      delete :destroy, id: @admin_competition
    end

    assert_redirected_to admin_competitions_path
  end
end
