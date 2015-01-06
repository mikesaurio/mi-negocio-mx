class ImcosController < ApplicationController
  

  def index
    @municipios = Municipio.all

     if params[:query].present?
      @results = Municipio.search(params[:query], nombre: params[:nombre])
    else
      @results = Municipio.all
    end

  end

   def autocomplete
    render json: Municipio.search(params[:query], autocomplete: true).map(&:nombre)
  end

end
