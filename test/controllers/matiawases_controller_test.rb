require 'test_helper'

class MatiawasesControllerTest < ActionController::TestCase
  setup do
    @matiawase = matiawases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matiawases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matiawase" do
    assert_difference('Matiawase.count') do
      post :create, matiawase: { devid: @matiawase.devid, groupname: @matiawase.groupname, iconSelect: @matiawase.iconSelect, latitude: @matiawase.latitude, longitude: @matiawase.longitude, username: @matiawase.username }
    end

    assert_redirected_to matiawase_path(assigns(:matiawase))
  end

  test "should show matiawase" do
    get :show, id: @matiawase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matiawase
    assert_response :success
  end

  test "should update matiawase" do
    patch :update, id: @matiawase, matiawase: { devid: @matiawase.devid, groupname: @matiawase.groupname, iconSelect: @matiawase.iconSelect, latitude: @matiawase.latitude, longitude: @matiawase.longitude, username: @matiawase.username }
    assert_redirected_to matiawase_path(assigns(:matiawase))
  end

  test "should destroy matiawase" do
    assert_difference('Matiawase.count', -1) do
      delete :destroy, id: @matiawase
    end

    assert_redirected_to matiawases_path
  end
end
