class InspectionLinesController < ApplicationController
   before_action :set_line, only: [:show, :edit, :update, :destroy]

 def index
   @inspection_lines =  InspectionLine.all
 end

 def show
  @inspection_lines=  InspectionLine.all
    @inspection = Inspection.all
  @Line = Line.all
 end

 def new
  @inspection_line = InspectionLine.new
  @inspection = Inspection.all
  @Line = Line.all
end

def edit
  @inspection = Inspection.all
  @line = Line.all
end

def create
  @inspection_line = InspectionLine.new(line_params)
  respond_to do |format|
    if @inspection_line.save
      format.html { redirect_to @inspection_line, notice: 'Line was successfully created.' }
      format.json { render :show, status: :created, location: @inspection_line }
    else
      format.html { render :new }
      format.json { render json: @inspection_line.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @inspection_line.update(line_params)
      format.html { redirect_to @inspection_line, notice: 'Line was successfully updated.' }
      format.json { render :show, status: :ok, location: @inspection_line}
    else
      format.html { render :edit }
      format.json { render json: @inspection_line.errors, status: :unprocessable_entity }
    end
  end
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @inspection_line = InspectionLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:inspection_line).permit(:id, :inspection_id, :line_id)
    end

  end
