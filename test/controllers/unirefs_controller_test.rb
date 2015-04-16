require 'test_helper'

class UnirefsControllerTest < ActionController::TestCase
  setup do
    @uniref = unirefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unirefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uniref" do
    assert_difference('Uniref.count') do
      post :create, uniref: { shortname: @uniref.shortname }
    end

    assert_redirected_to uniref_path(assigns(:uniref))
  end

  test "should show uniref" do
    get :show, id: @uniref
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uniref
    assert_response :success
  end

  test "should update uniref" do
    patch :update, id: @uniref, uniref: { shortname: @uniref.shortname }
    assert_redirected_to uniref_path(assigns(:uniref))
  end

  test "should destroy uniref" do
    assert_difference('Uniref.count', -1) do
      delete :destroy, id: @uniref
    end

    assert_redirected_to unirefs_path
  end
end
