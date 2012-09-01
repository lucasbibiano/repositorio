# -*- encoding : utf-8 -*-
require 'test_helper'

class Admin::RepresentantesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
