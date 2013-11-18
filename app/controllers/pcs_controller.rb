class PcsController < ApplicationController
  include IsAssetController

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
    params[:pc].permit(:name, :description, :player_id, :attached_picture, :remove_attached_picture, as_origin_relationships_attributes: [:target_id, :target_type, :target_description, :target_custom_name, :_destroy, :id, :attached_picture, :remove_attached_picture], memberships_attributes: [:group_id, :target_description, :_destroy, :id, :target_custom_name, :attached_picture, :remove_attached_picture])
  end
end
