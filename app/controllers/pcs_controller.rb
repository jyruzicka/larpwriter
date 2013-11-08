class PcsController < ApplicationController
  include IsAsset

  def index
    @pcs = @larp.pcs.by_name
  end

  def new
    @pc = @larp.pcs.build
  end

  def create
    @pc = @larp.pcs.build pc_params
    if @pc.save
      redirect_to larp_pc_path(@larp, @pc), notice: "PC successfully added!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pc.update pc_params
      redirect_to larp_pc_path(@larp, @pc), notice: "PC successfully edited"
    else
      render :edit
    end
  end

  def destroy
    @pc.destroy!
    redirect_to larp_pcs_path(@larp), notice: "PC '#{@pc.name}' successfully removed"
  end

  private

  def get_asset
    @pc = @larp.pcs.find params[:id]
  end

  def pc_params
    params[:pc].permit(:name, :description, :player_id)
  end
end
