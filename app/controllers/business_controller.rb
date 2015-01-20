class BusinessController < ApplicationController
    layout 'blanco'
  
  def index
     set_municipio(:municipio_id)
   cargar_menus
     
  end 
  
  
  def steps
      set_municipio(:municipio_id)
      @formation_steps = FormationStep.all
      valores  if params[:post][:lines]
      cargar_menus
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


    def cargar_menus
      @link_1 ="/dashboard"
     @texto_link_1 = "Tramites"
      @link_2="/dashboard"
     @texto_link_2 = "Inspecciones"
      @link_3 ="/dashboard"
     @texto_link_3 = "Inspectores"
    end

end
