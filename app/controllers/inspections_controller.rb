class InspectionsController < ApplicationController
  before_action :set_inspection, only: :show
  before_action :set_municipio, only: [:index, :show]
  layout 'blanco'

  def index
    if params[:q]
      @inspections = Inspection.search(params[:q]).order("created_at DESC")
    else
      @inspections = Inspection.all
    end

    cargar_menus
  end

  def show

    cargar_menus
  end

  private
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    def inspection_params
      params.require(:inspection).permit(:nombre, :materia, :duracion, :norma, :antes, :durante, :despues, :sancion, :dependency_id)
    end

    def set_municipio
       @municipio = Municipio.find(params[:municipio_id])
    end


     def cargar_menus
      @link_1 ="/dashboard"
     @texto_link_1 = "Apertura"
      @link_2="/dashboard"
     @texto_link_2 = "Tramites"
      @link_3 =""
     @texto_link_3 = ""
    end

end
