class NpcPlayersController < ApplicationController
  include IsAsset

  def index
    @npc_players = @larp.npc_players.by_name
  end

  def new
    @npc_player = @larp.npc_players.build
  end

  def create
    @npc_player = @larp.npc_players.build npc_player_params
    if @npc_player.save
      redirect_to larp_npc_player_path(@larp, @npc_player), notice: "NPC player successfully added"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @npc_player.update npc_player_params
      redirect_to larp_npc_player_path(@larp, @npc_player), notice: "NPC player successfully edited"
    else
      render :edit
    end
  end

  def destroy
    @npc_player.destroy!
    redirect_to larp_npc_players_path(@larp), notice: "NPC player '#{@npc_player.name}' successfully removed"
  end

  private

  def get_asset
    @npc_player = @larp.npc_players.find params[:id]
  end

  def npc_player_params
    params[:npc_player].permit(:first_name, :last_name, :email, :notes, :phone_numbers, :postal_address, :birth_date_as_string, :picture, :remove_picture)
  end
end
