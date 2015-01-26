module Dashboard
  class ProceduresController < ApplicationController
    before_action :set_procedure, only: [:edit, :update, :destroy]
    before_action :authenticate_user!
    layout 'dashboard'

    def index 
      @procedures = policy_scope(Procedure)
    end

    def new
      @procedure = Procedure.new
    end

    def edit
    end

    def create
      @procedure = Procedure.new(procedure_params)
      @procedure.municipio = current_user.municipio
      authorize @procedure

      respond_to do |format|
        if @procedure.save
          format.html { redirect_to edit_dashboard_procedure_url(@procedure), notice: 'El trámite fue creado satisfactoriamente.' }
          format.json { render :show, status: :created, location: @procedure }
        else
          format.html { render :new }
          format.json { render json: @procedure.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      authorize @procedure

      respond_to do |format|
        if @procedure.update(procedure_params)
          format.html { redirect_to edit_dashboard_procedure_url(@procedure), notice: 'El trámite fue actualizado satisfactoriamente.' }
          format.json { render :show, status: :ok, location: @procedure}
        else
          format.html { render :edit }
          format.json { render json: @requirement.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      authorize @procedure

      @procedure.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_procedures_path notice: 'El trámite fue borrado satisfactoriamente.' }
        format.json { head :no_content }
      end
    end

    private
    def set_requirement
      @procedure = Procedure.find(params[:id])
    end

    def requirement_params
      params.require(:procedure).permit(:nombre, :descripcion, :path, :type, :municipio_id)
    end
  end
end
