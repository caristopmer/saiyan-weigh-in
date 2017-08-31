class ChartsController < ApplicationController
  def display
    @user = User.find(params[:id])
    stat = params[:stat]
    time = params[:time].to_i

    render "charts/_chart", locals: { user: @user, stat: stat, time: time }, layout: false
  end
end