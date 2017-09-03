class PowerLevelsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @levels = @user.power_levels
  end

  def create
    @level = PowerLevel.new(level_params)
    @user = User.find(params[:id])
    @level.user = @user
    @level.level = @level.calculate_level
    if @level.save 
      @level.average_level = @level.calculate_average_level
      @level.save
      redirect_to user_path(@level.user)
    else
      @errors = @level.errors.full_messages
      @errors = ["Calculating power level require a weight entry within the past week and a push-up heat within the past 3 days."] if @level.level == nil
      render "users/show"
    end
  end

  def destroy
    @level = PowerLevel.find(params[:id])
    if @level.user == current_user
      @level.destroy
      redirect_to user_path(current_user)
    end
  end

  private

  def level_params
    params.require(:power_level).permit(:entry_date)
  end
end