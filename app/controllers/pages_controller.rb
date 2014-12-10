class PagesController < ApplicationController
 layout 'paginas'

  def quiere
     @titulo = "¿Qué quieres saber?"
    @subtitulo= "Encuentra toda la información para tu negocio"
    @param = params[:municipio]
    $id_del_municipio = @param[:municipio_id]
  end

  def encuesta
  end

  def paso
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
