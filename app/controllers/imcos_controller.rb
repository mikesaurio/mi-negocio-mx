class ImcosController < ApplicationController

  def index
    @titulo = "Ubicación de tu negocio"
    @subtitulo = "Selecciona un municipio"
  end

  def nuevo
       @titulo = "¿Qué quieres saber?"
      @subtitulo= "Encuentra toda la información para tu negocio"
      @param = params[:municipio]
      $id_del_municipio = @param[:municipio_id]
   end

def tramite
   @titulo = Municipio.find($id_del_municipio).nombre 

   



end




end
