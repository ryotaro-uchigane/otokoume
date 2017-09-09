class GraphsController < ApplicationController
  def index
  end
  def draw
    @chart_data = Progress.order('date ASC').group(:date).count
  end
end
