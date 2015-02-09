class ImcosController < ApplicationController
  

  def index
    @municipios = Municipio.all

  respond_to do |format|
    format.html
    format.csv { send_data @municipios.to_csv }
    format.xls # { send_data @@municipios.to_csv(col_sep: "\t") }
  end

     if params[:query].present?
      @results = Municipio.search(params[:query], nombre: params[:nombre])
    else
      @results = Municipio.all
    end

  end
end
