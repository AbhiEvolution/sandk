require "test_helper"

class TreatementtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatementtype = treatementtypes(:one)
  end

  test "should get index" do
    get treatementtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_treatementtype_url
    assert_response :success
  end

  test "should create treatementtype" do
    assert_difference("Treatementtype.count") do
      post treatementtypes_url, params: { treatementtype: { name: @treatementtype.name } }
    end

    assert_redirected_to treatementtype_url(Treatementtype.last)
  end

  test "should show treatementtype" do
    get treatementtype_url(@treatementtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatementtype_url(@treatementtype)
    assert_response :success
  end

  test "should update treatementtype" do
    patch treatementtype_url(@treatementtype), params: { treatementtype: { name: @treatementtype.name } }
    assert_redirected_to treatementtype_url(@treatementtype)
  end

  test "should destroy treatementtype" do
    assert_difference("Treatementtype.count", -1) do
      delete treatementtype_url(@treatementtype)
    end

    assert_redirected_to treatementtypes_url
  end
end
