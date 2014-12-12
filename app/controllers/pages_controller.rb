class PagesController < ApplicationController
 layout 'paginas'

 def quiere
   @titulo = "¿Qué quieres saber?"
   @subtitulo= "Encuentra toda la información para tu negocio en"
   @param = params[:municipio]
   $id_del_municipio = @param[:municipio_id]
   @municipio = Municipio.find($id_del_municipio).nombre
 end

 def encuesta
    @titulo = "Tramites"
   @subtitulo= "Primero contesta esta breve encuesta"
 end

 def paso
 @titulo = "Tramites"
  @param_paso = params[:lines]
  $id_del_giro = @param_paso[:line_id]
  @subtitulo = Line.find($id_del_giro).nombre
  @subtitulo= "Abrir y operar #{@subtitulo} "

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
