class SoccerPlayersController < ApplicationController

  def index
    @soccer_players = SoccerPlayer.seek(params)
  end

  def new
    @soccer_player = SoccerPlayer.new
  end

  def edit
    @soccer_player = SoccerPlayer.find(params[:id])
  end

  def create
    @soccer_player = SoccerPlayer.new(params[:soccer_player])

    if @soccer_player.save
      flash[:notice] = 'Soccer player was successfully created.'
      redirect_to(soccer_players_path)
    else
      render :new
    end
  end

  def update
    @soccer_player = SoccerPlayer.find(params[:id])

    if @soccer_player.update_attributes(params[:soccer_player])
      flash[:notice] = 'Soccer player was successfully updated.'
      redirect_to(soccer_players_path)
    else
      render :edit
    end
  end

  def destroy
    @soccer_player = SoccerPlayer.find(params[:id])
    @soccer_player.destroy
    flash[:notice] = "Soccer player #{@soccer_player.name} deleted"
  end

end
