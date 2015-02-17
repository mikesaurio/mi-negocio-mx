class FormationStepsController < ApplicationController
 layout 'blanco'
 before_action :set_formation_steps, only: [:show]
helper :formation_steps

 def index
  set_municipio(:municipio_id)
  @tipo = 'AF'
  valores  if params[:get]
    @municipios = Municipio.all
end

def valores
  if params[:get][:lines]
   @line = params[:get][:lines]
   @tipo = params[:rating]
   @formation_steps = FormationStep.by_city(@municipio)
   # @heading = view_context.heading_search(Line.find(@line).nombre.downcase)
   # @subheading = view_context.subheading_search(@tipo)
 end
end

def show
end

private
      # Use callbacks to share common setup or constraints between actions.
      def set_municipio(val)
        @municipio = Municipio.find(params[val])
      end

      def set_formation_steps
        @formation_step = FormationStep.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def formation_step_params
        params.require(:formationsteps).permit(:name, :description,:path,:type )
      end
    end
