class HeatsController < ApplicationController
  def index
    @heats = Heat.all
  end

  def create
    @heat = Heat.new(heat_params)
    @heat.user = current_user
    if @heat.save
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
    params.require(:heat).permit(:pushup_type, :length, :count)
  end
end