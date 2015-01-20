class BusinessController < ApplicationController
    layout 'blanco'
  
  def index
      set_municipio(:municipio_id)
      @tipo = 'AF'
       valores  if params[:get]

 end
  
  def valores
    if params[:get][:lines]
       @line = params[:get][:lines]
        @tipo = params[:rating]
        @formation_steps = FormationStep.all
    end
  end
  
  
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipio(val)
      @municipio = Municipio.find(params[val])
    end
    def municipio_params
      params.require(:municipio).permit(:nombre)
    end



end
