class UsersController < ApplicationController
  def show
    @user = current_user
    @entry = Entry.new(user: @user, weight_unit: "lbs.")
  end
end