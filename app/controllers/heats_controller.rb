class HeatsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @heats = @user.heats
  end

  def create
    @heat = Heat.new(heat_params)
    @user = User.find(params[:id])
    @heat.user = @user
    @heat.length = 30
    @heat.count /= 2 if @heat.pushup_type == "knee"
    if @heat.save
      @heat.average_count = @heat.calculate_average_count
      @heat.save
      redirect_to user_path(@heat.user)
    else
      @errors = @heat.errors.full_messages
      render "users/show"      
    end
  end

  def destroy
    @heat = Heat.find(params[:id])
    @heat.destroy
    redirect_to user_path(current_user)
  end

  private

  def heat_params
    params.require(:heat).permit(:count, :entry_date, :pushup_type)
  end
end