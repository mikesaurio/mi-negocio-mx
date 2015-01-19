class InspectorsController < ApplicationController
  before_action :set_inspector, only: :show
  before_action :set_municipio, only: [:index, :show]
  layout 'blanco'

  def index
    @inspectors = Inspector.by_city(@municipio)

    if params[:q]
      @inspectors = @inspectors.search_by_city(@municipio, params[:q])
    else
      @inspectors
    end
  end

  def show
    @dependency = Dependency.by_city(@municipio)
  end

  private
    def set_inspector
      @inspector = Inspector.find(params[:id])
    end

    def inspector_params
      params.require(:inspector).permit(:nombre, :vigencia, :materia, :supervisor, :contacto, :foto, :dependency_id)
    end

    def set_municipio
       @municipio = Municipio.find(params[:municipio_id])
    end
end
