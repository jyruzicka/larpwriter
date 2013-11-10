class NpcsController < ApplicationController
  include IsAsset

  def index
    @npcs = @larp.npcs.by_name
  end

  def new
    @npc = @larp.npcs.build
  end

  def create
    @npc = @larp.npcs.build npc_params
    if @npc.save
      redirect_to larp_npc_path(@larp, @npc), notice: "NPC successfully added!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @npc.update npc_params
      redirect_to larp_npc_path(@larp, @npc), notice: "NPC successfully edited"
    else
      render :edit
    end
  end

  def destroy
    @npc.destroy!
    redirect_to larp_npcs_path(@larp), notice: "NPC '#{@npc.name}' successfully removed"
  end

  private

  def get_asset
    @npc = @larp.npcs.find params[:id]
  end

  def npc_params
    params[:npc].permit(:name, :description, :npc_player_id)
  end
end
