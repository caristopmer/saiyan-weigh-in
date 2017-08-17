class EntriesController < ApplicationController
  def create
    @entry.entry_date = Date.today
    if @entry.save
      redirect_to user_path(@user)
    else
      @errors = @entry.errors.full_messages
      render "users/show"
    end
  end
end