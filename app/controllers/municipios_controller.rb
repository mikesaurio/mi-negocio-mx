class MunicipiosController < ApplicationController
  layout 'blanco'
  before_action :set_municipio, only: [:edit, :update, :destroy]

  def index
    @municipios = Municipio.all
  end

  def show
    if request.post?
      @municipio = Municipio.find_by(nombre:  params[:query]) #guardamos el id del municipio
    else
      set_municipio
    end
  end

  def new
    @municipio = Municipio.new
  end

  def edit
  end

  def open
  @titulo_fisico = "Crear un negocio como persona fisica"
  @titulo_moral = "Crear un negocio como persona moral"
  @requirements = Requirement.all
end

  def create
    @municipio = Municipio.new(municipio_params)

    respond_to do |format|
      if @municipio.save
        format.html { redirect_to @municipio, notice: 'Municipio was successfully created.' }
        format.json { render :show, status: :created, location: @municipio }
      else
        format.html { render :new }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipio.update(municipio_params)
        format.html { redirect_to @municipio, notice: 'Municipio was successfully updated.' }
        format.json { render :show, status: :ok, location: @municipio }
      else
        format.html { render :edit }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @municipio.destroy
    respond_to do |format|
      format.html { redirect_to municipios_url, notice: 'Municipio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipio
      @municipio = Municipio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def municipio_params
      params.require(:municipio).permit(:nombre)
    end
end
