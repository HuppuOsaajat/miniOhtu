require 'test_helper'

class BibrefsControllerTest < ActionController::TestCase
  setup do
    @bibref = bibrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bibrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bibref" do
    assert_difference('Bibref.count') do
      post :create, bibref: { shortname: @bibref.shortname, reftype: @bibref.reftype }
    end

  end

  test "should show bibref" do
    get :show, id: @bibref
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bibref
    assert_response :success
  end

  # test "should update bibref" do
  #   patch :update, id: @bibref, bibref: { shortname: @bibref.shortname, reftype: @bibref.reftype }
  #   assert_redirected_to bibref_path(assigns(:bibref))
  # end

  test "should destroy bibref" do
    assert_difference('Bibref.count', -1) do
      delete :destroy, id: @bibref
    end

    assert_redirected_to bibrefs_path
  end
end

