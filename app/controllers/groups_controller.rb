class GroupsController < ApplicationController
  include IsAssetController

  def index
    @groups = @larp.groups.by_name
  end

  def new
    @group = @larp.groups.build
  end

  def create
    @group = @larp.groups.build group_params
    if @group.save
      redirect_to larp_group_path(@larp, @group), notice: "group successfully added!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update group_params
      redirect_to larp_group_path(@larp, @group), notice: "group successfully edited"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy!
    redirect_to larp_groups_path(@larp), notice: "group '#{@group.name}' successfully removed"
  end

  private

  def get_asset
    @group = @larp.groups.find params[:id]
  end

  def group_params
    params[:group].permit(:name, :tags_string, :description, :attached_picture, :remove_attached_picture, memberships_attributes: [:target_id, :target_type, :target_description, :_destroy, :id, :target_custom_name, :attached_picture, :remove_attached_picture], as_origin_relationships_attributes: [:target_id, :target_type, :target_description, :target_custom_name, :_destroy, :id, :attached_picture, :remove_attached_picture], asset_documents_attributes: [:document_id, :_destroy, :id])
  end
end
