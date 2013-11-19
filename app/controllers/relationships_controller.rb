class RelationshipsController < ApplicationController
  include IsAssetController

  respond_to :json, only: :change_position

  def missing
    @relationships_without_reverse = @larp.relationships.without_reverse
  end

  def change_position
    relationship = @larp.relationships.find params[:id], lock: true
    relationship.update_position! params[:position]
    head :ok
  end
end
