class InspectionsController < ApplicationController
  before_action :set_inspection, only: :show
  layout 'blanco'

  def index
    # raise params.inspect
    @municipio = Municipio.find(params[:municipio_id])
    if params[:q]
      @inspections = Inspection.search(params[:q]).order("created_at DESC")
    else
      @inspections = Inspection.all
    end
  end

  def show
  end

  private
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    def inspection_params
      params.require(:inspection).permit(:nombre, :materia, :duracion, :norma, :antes, :durante, :despues, :sancion, :dependency_id)
    end
end
