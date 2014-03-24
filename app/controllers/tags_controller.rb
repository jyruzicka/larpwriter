class TagsController < ApplicationController
  include IsAssetController

  def index
    redirect_to @larp
  end

  def show
  end

  def edit
  end

  def update
    if @tag.update tag_params
      redirect_to larp_tag_path(@larp, @tag), notice: "tag successfully edited"
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy!
    redirect_to larp_tags_path(@larp), notice: "tag '#{@tag.name}' successfully removed"
  end

  private

  def get_asset # rubocop:disable AccessorMethodName
    @tag = @larp.tags.find params[:id]
  end

  def tag_params
    params[:tag].permit(:name, :description,  :color)
  end
end
