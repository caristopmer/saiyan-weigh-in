class TeamsController < ApplicationController

  def index
    
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    
  end

  def create
    
  end

  def destroy
    
  end

end