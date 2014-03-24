class PlayersController < ApplicationController
  include IsAssetController

  def index
    @players = @larp.players.by_name
  end

  def new
    @player = @larp.players.build
  end

  def create
    @player = @larp.players.build player_params
    if @player.save
      redirect_to larp_player_path(@larp, @player), notice: "Player successfully added"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @player.update player_params
      redirect_to larp_player_path(@larp, @player), notice: "Player successfully edited"
    else
      render :edit
    end
  end

  def destroy
    @player.destroy!
    redirect_to larp_players_path(@larp), notice: "Player '#{@player.name}' successfully removed"
  end

  private

  def get_asset # rubocop:disable AccessorMethodName
    @player = @larp.players.find params[:id]
  end

  def player_params
    params[:player].permit(:first_name, :last_name, :tags_string, :email, :notes, :phone_numbers, :postal_address, :birth_date_as_string, :attached_picture, :remove_attached_picture)
  end
end
