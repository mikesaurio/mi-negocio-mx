class BusinessController < ApplicationController
    layout 'blanco'
  
  def index
     set_municipio(:municipio_id)
  end 
  
  
  def steps
      set_municipio(:municipio_id)
      @requirements = Requirement.all
      valores  if params[:post][:lines]
    
  end
  
  def valores
     @line = params[:post][:lines]
     @tipo = params[:rating]
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
