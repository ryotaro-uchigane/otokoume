class GraphsController < ApplicationController
  def index
    @chart_data0 = make_chart_data(params[:bus], params[:job], 0)
    @chart_data1 = make_chart_data(params[:bus], params[:job], 1)
    @chart_data2 = make_chart_data(params[:bus], params[:job], 2)
  end

  def make_chart_data(bus, job, stat)
    if bus.blank? && job.blank?
      raw_data = Progress.order('date ASC').where("status = #{stat}").group(:date).count
    else
      raw_data = Progress.order('date ASC').where("status = #{stat} and business_category = #{params[:bus]} and occupation_category = #{params[:job]}").group(:date).count
    end

    for d in raw_data.keys[0]..raw_data.keys[-1] do
      raw_data[d] = 0 if raw_data[d].blank?
    end

    raw_data
  end
end
