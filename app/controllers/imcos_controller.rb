class ImcosController < ApplicationController
  def index
    @titulo = "Ubicación de tu negocio"
   
    @subtitulo = "Selecciona un municipio"


  end

  def nuevo
     @titulo = params[:municipio]
   end




end
