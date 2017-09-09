class GraphsController < ApplicationController
  def index
    if params[:bus].blank? and params[:job].blank?
      @chart_data0 = Progress.order('date ASC').where("status = 0").group(:date).count
    else
      @chart_data0 = Progress.order('date ASC').where("status = 0 and business_category = #{params[:bus]} and occupation_category = #{params[:job]}").group(:date).count
    end

    if params[:bus].blank? and params[:job].blank?
      @chart_data1 = Progress.order('date ASC').where("status = 1").group(:date).count
    else
      @chart_data1 = Progress.order('date ASC').where("status = 1 and business_category = #{params[:bus]} and occupation_category = #{params[:job]}").group(:date).count
    end

    if params[:bus].blank? and params[:job].blank?
      @chart_data2 = Progress.order('date ASC').where("status = 2").group(:date).count
    else
      @chart_data2 = Progress.order('date ASC').where("status = 2 and business_category = #{params[:bus]} and occupation_category = #{params[:job]}").group(:date).count
    end


  end
end
