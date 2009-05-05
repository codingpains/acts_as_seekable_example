class TeamsController < ApplicationController

  def index
    @teams = Team.seek(params)
  end

  def show
    @team = Team.find_by_id(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])

    if @team.save
      flash[:notice] = 'Team was successfully created.'
      redirect_to(teams_path)
    else
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      flash[:notice] = 'Team was successfully updated.'
      redirect_to(teams_path)
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:notice] = "Team #{@team.name} deleted"
    respond_to do |format|
      format.html {redirect_to(teams_path)}
      format.js
    end
  end

end
