require 'test_helper'

class DrinktwosControllerTest < ActionController::TestCase
  setup do
    @drinktwo = drinktwos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drinktwos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drinktwo" do
    assert_difference('Drinktwo.count') do
      post :create, drinktwo: { name: @drinktwo.name, temperature: @drinktwo.temperature }
    end

    assert_redirected_to drinktwo_path(assigns(:drinktwo))
  end

  test "should show drinktwo" do
    get :show, id: @drinktwo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drinktwo
    assert_response :success
  end

  test "should update drinktwo" do
    patch :update, id: @drinktwo, drinktwo: { name: @drinktwo.name, temperature: @drinktwo.temperature }
    assert_redirected_to drinktwo_path(assigns(:drinktwo))
  end

  test "should destroy drinktwo" do
    assert_difference('Drinktwo.count', -1) do
      delete :destroy, id: @drinktwo
    end

    assert_redirected_to drinktwos_path
  end
end
