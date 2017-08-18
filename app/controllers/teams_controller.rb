class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      @team.members << @team.captain
      @team.save
      redirect_to team_path(@team)
    else
      @errors = @team.errors.full_messages
      render "teams/new"
    end
  end

  def destroy
    
  end

  private

  def team_params
    params.require(:team).permit(:name, :captain_id)
  end

end