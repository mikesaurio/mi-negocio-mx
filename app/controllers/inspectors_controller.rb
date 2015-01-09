class InspectorsController < ApplicationController
  before_action :set_inspector, only: :show
  layout 'blanco'

  def index
    @municipio = Municipio.find(params[:municipio_id])
   
    if params[:q]
      @inspectors = Inspector.search(params[:q]).order("created_at DESC")
    else
      @inspectors = Inspector.all
    end

    @dependency = Dependency.all
  end

  def show
  end

  private
    def set_inspector
      @inspector = Inspector.find(params[:id])
    end

    def inspector_params
      params.require(:inspector).permit(:nombre, :vigencia, :materia, :supervisor, :contacto, :foto, :dependency_id)
    end
end
