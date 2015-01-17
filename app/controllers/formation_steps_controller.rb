class FormationStepsController < ApplicationController
   layout 'blanco'
    before_action :set_formation_steps, only: [:show]

    def index
      @formation_steps = FormationStep.all
    end

    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_formation_steps
        @formation_step = FormationStep.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def formation_step_params
        params.require(:formationsteps).permit(:name, :description,:path,:type )
      end
    end
