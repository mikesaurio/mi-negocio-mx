require 'test_helper'

class InspectionsControllerTest < ActionController::TestCase
  setup do
    @inspection = inspections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inspections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inspection" do
    assert_difference('Inspection.count') do
      post :create, inspection: { antes: @inspection.antes, despues: @inspection.despues, duracion: @inspection.duracion, durante: @inspection.durante, materia: @inspection.materia, nombre: @inspection.nombre, norma: @inspection.norma, sancion: @inspection.sancion }
    end

    assert_redirected_to inspection_path(assigns(:inspection))
  end

  test "should show inspection" do
    get :show, id: @inspection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inspection
    assert_response :success
  end

  test "should update inspection" do
    patch :update, id: @inspection, inspection: { antes: @inspection.antes, despues: @inspection.despues, duracion: @inspection.duracion, durante: @inspection.durante, materia: @inspection.materia, nombre: @inspection.nombre, norma: @inspection.norma, sancion: @inspection.sancion }
    assert_redirected_to inspection_path(assigns(:inspection))
  end

  test "should destroy inspection" do
    assert_difference('Inspection.count', -1) do
      delete :destroy, id: @inspection
    end

    assert_redirected_to inspections_path
  end
end
