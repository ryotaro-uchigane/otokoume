class ProgressesController < ApplicationController
  before_action :set_progress, only: [:show, :edit, :update, :destroy]

  # GET /progresses
  # GET /progresses.json
  def index
    @progresses = Progress.all
  end

  # GET /progresses/1
  # GET /progresses/1.json
  def show

    @chart_data0 = Progress.where("company_name = \"#{@progress.company_name}\"").order('date ASC').where("status = 0").group(:date).count
    @chart_data1 = Progress.where("company_name = \"#{@progress.company_name}\"").order('date ASC').where("status = 1").group(:date).count
    @chart_data2 = Progress.where("company_name = \"#{@progress.company_name}\"").order('date ASC').where("status = 2").group(:date).count
  end

  # GET /progresses/new
  def new
    @progress = Progress.new
    @progress.user_id = params[:user_id]
  end

  # GET /progresses/1/edit
  def edit
  end

  # POST /progresses
  # POST /progresses.json
  def create
    @progress = Progress.new(progress_params)

    respond_to do |format|
      if @progress.save
        format.html { redirect_to user_path(@progress.user_id), notice: 'Progress was successfully created.' }
        format.json { render :show, status: :created, location: @progress }
      else
        format.html { render :new }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progresses/1
  # PATCH/PUT /progresses/1.json
  def update
    respond_to do |format|
      if @progress.update(progress_params)
        format.html { redirect_to user_path(@progress.user_id), notice: 'Progress was successfully updated.' }
        format.json { render :show, status: :ok, location: @progress }
      else
        format.html { render :edit }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progresses/1
  # DELETE /progresses/1.json
  def destroy
    @progress.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@progress.user_id), notice: 'Progress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress
      @progress = Progress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_params
      params.require(:progress).permit(:user_id, :company_name, :business_category, :occupation_category, :status)
    end
end
