# -*- encoding : utf-8 -*-
require 'test_helper'

class Representante::AthletesControllerTest < ActionController::TestCase
  setup do
    @representante_athlete = representante_athletes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:representante_athletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create representante_athlete" do
    assert_difference('Representante::Athlete.count') do
      post :create, representante_athlete: { age: @representante_athlete.age, name: @representante_athlete.name, sex: @representante_athlete.sex }
    end

    assert_redirected_to representante_athlete_path(assigns(:representante_athlete))
  end

  test "should show representante_athlete" do
    get :show, id: @representante_athlete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @representante_athlete
    assert_response :success
  end

  test "should update representante_athlete" do
    put :update, id: @representante_athlete, representante_athlete: { age: @representante_athlete.age, name: @representante_athlete.name, sex: @representante_athlete.sex }
    assert_redirected_to representante_athlete_path(assigns(:representante_athlete))
  end

  test "should destroy representante_athlete" do
    assert_difference('Representante::Athlete.count', -1) do
      delete :destroy, id: @representante_athlete
    end

    assert_redirected_to representante_athletes_path
  end
end
