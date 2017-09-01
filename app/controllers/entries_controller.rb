class EntriesController < ApplicationController
  def create
    @entry = Entry.new(entry_params)
    @entry.user = User.find(params[:id])
    @entry.weight_unit = "lbs."
    if @entry.save
      @entry.average_weight = @entry.calculate_average_weight
      @entry.save
      redirect_to user_path(@entry.user)
    else
      @errors = @entry.errors.full_messages
      @user = @entry.user
      render "users/show"
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    if @entry.user == current_user
      @entry.destroy
      redirect_to user_path(current_user)
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:weight, :entry_date)
  end
end