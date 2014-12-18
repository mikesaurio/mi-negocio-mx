module Dashboard
  class InspectionsController < ApplicationController
    before_action :set_inspection, only: [:edit, :update, :destroy]
    before_action :authenticate_user!
    layout 'user'

    def new
      @inspection = Inspection.new
      @dependency = Dependency.all
    end

    def edit
      @dependency = Dependency.all
    end

    def create
      @inspection = Inspection.new(inspection_params)

      respond_to do |format|
        if @inspection.save
          format.html { redirect_to @inspection, notice: 'Inspection was successfully created.' }
          format.json { render :show, status: :created, location: @inspection }
        else
          format.html { render :new }
          format.json { render json: @inspection.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @inspection.update(inspection_params)
          format.html { redirect_to @inspection, notice: 'Inspection was successfully updated.' }
          format.json { render :show, status: :ok, location: @inspection }
        else
          format.html { render :edit }
          format.json { render json: @inspection.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @inspection.destroy
      respond_to do |format|
        format.html { redirect_to inspections_url, notice: 'Inspection was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    def inspection_params
      params.require(:inspection).permit(:nombre, :materia, :duracion, :norma, :antes, :durante, :despues, :sancion, :dependency_id)
    end
  end
end
