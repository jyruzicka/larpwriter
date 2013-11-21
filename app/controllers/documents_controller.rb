class DocumentsController < ApplicationController
  include IsAssetController

  def index
    @documents = @larp.documents.by_name
  end

  def new
    @document = @larp.documents.build
  end

  def create
    @document = @larp.documents.build document_params
    if @document.save
      redirect_to larp_document_path(@larp, @document), notice: "document successfully added!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @document.update document_params
      redirect_to larp_document_path(@larp, @document), notice: "document successfully edited"
    else
      render :edit
    end
  end

  def destroy
    @document.destroy!
    redirect_to larp_documents_path(@larp), notice: "document '#{@document.name}' successfully removed"
  end

  private

  def get_asset
    @document = @larp.documents.find params[:id]
  end

  def document_params
    params[:document].permit(:name, :tags_string, :content, :is_included_in_all_pcs, :is_included_in_all_npcs, :file, :remove_file)
  end
end
