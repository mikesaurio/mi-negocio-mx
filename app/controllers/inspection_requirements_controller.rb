class InspectionRequirementsController < ApplicationController
   before_action :set_line, only: [:show, :edit, :update, :destroy]

 def index
   @procedure_requirements =  ProcedureRequirement.all
 end

 def show
  @procedure_requirements=  ProcedureRequirement.all
    @procedure = Procedure.all
  @requirement = Requirement.all
 end

 def new
  @procedure_requirement = ProcedureRequirement.new
  @procedure = Procedure.all
  @requirement = Requirement.all
end

def edit
  @procedure = Procedure.all
  @requirement = LiRequirementne.all
end

def create
  @procedure_requirement = ProcedureRequirement.new(line_params)
  respond_to do |format|
    if @procedure_requirements.save
      format.html { redirect_to @procedure_requirements, notice: 'Line was successfully created.' }
      format.json { render :show, status: :created, location: @procedure_requirements }
    else
      format.html { render :new }
      format.json { render json: @procedure_requirements.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @procedure_requirements.update(line_params)
      format.html { redirect_to @procedure_requirements, notice: 'Line was successfully updated.' }
      format.json { render :show, status: :ok, location: @procedure_requirements}
    else
      format.html { render :edit }
      format.json { render json: @procedure_requirements.errors, status: :unprocessable_entity }
    end
  end
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @procedure_requirements = ProcedureRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:procedure_requirements).permit(:id, :procedure_id, :requirement_id)
    end

  end
