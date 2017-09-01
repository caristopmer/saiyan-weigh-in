class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(team: Team.find(params[:id]))
    @membership.user = current_user
    if @membership.save
      redirect_to team_path(@membership.team)
    else
      @errors = @membership.errors.full_messages
      render "teams/show"
    end
  end

  def destroy
    @membership = Membership.find_by(user: current_user, team: Team.find(params[:id]))
    @membership.destroy
    redirect_to teams_path
  end
end