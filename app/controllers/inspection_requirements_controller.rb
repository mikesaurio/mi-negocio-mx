class InspectionRequirementsController < ApplicationController
    layout 'blanco'
  before_action :set_line, only: [:show, :edit, :update, :destroy]

 def index
   @inspection_requirements =  InspectionRequirement.all
 end

 def show
  @inspection_requirements=  InspectionRequirement.all
    @Inspection = Inspection.all
  @Requirement = Requirement.all
 end

 def new
  @inspection_requirement = InspectionRequirement.new
  @inspection = Inspection.all
  @requirement = Requirement.all
end

def edit
@inspection = Inspection.all
  @requirement = Requirement.all
end

def create
  @inspection_requirement = InspectionRequirement.new(line_params)
  respond_to do |format|
    if @inspection_requirement.save
      format.html { redirect_to @inspection_requirement, notice: 'Line was successfully created.' }
      format.json { render :show, status: :created, location: @inspection_requirement }
    else
      format.html { render :new }
      format.json { render json: @inspection_requirement.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @inspection_requirement.update(line_params)
      format.html { redirect_to @inspection_requirement, notice: 'Line was successfully updated.' }
      format.json { render :show, status: :ok, location: @inspection_requirement}
    else
      format.html { render :edit }
      format.json { render json: @inspection_requirement.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
    @inspection_requirement.destroy
    respond_to do |format|
      format.html { redirect_to inspection_requirements_url, notice: 'inspection_requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @inspection_requirement = InspectionRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:inspection_requirement).permit(:id, :inspection_id, :requirement_id)
    end

  end
