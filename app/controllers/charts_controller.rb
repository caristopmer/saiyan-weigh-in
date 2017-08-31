class ChartsController < ApplicationController
  def display
    @user = User.find(params[:id])
    stat = params[:stat]
    time = params[:time].to_i

    line_chart @user.chart_lines(stat, time).map { |name, data| { name: name, data: data }}, min: nil, max: nil
  end
end