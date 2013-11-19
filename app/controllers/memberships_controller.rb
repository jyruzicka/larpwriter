class MembershipsController < ApplicationController
  include IsAssetController

  respond_to :json, only: :change_position

  def change_position
    membership = @larp.memberships.find params[:id], lock: true
    membership.update_position! params[:position]
    head :ok
  end
end
