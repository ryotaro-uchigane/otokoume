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
    @chart_data0 = make_chart_data(@progress.company_name,0)
    @chart_data1 = make_chart_data(@progress.company_name,1)
    @chart_data2 = make_chart_data(@progress.company_name,2)
  end
  
  def make_chart_data(company, stat)
      raw_data = Progress.where("company_name = \"#{company}\"").order('date ASC').where("status = #{stat}").group(:date).count
    for d in raw_data.keys[0]..raw_data.keys[-1] do
      raw_data[d] = 0 if raw_data[d].blank?
    end

    raw_data
  end

  # GET /progresses/new
  def new
    @progress = Progress.new
    if !params[:user].blank?
      @progress.user_id = params[:user]
    end
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
