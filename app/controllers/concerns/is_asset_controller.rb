module IsAssetController
  extend ActiveSupport::Concern

  included do
    layout "larps"

    before_action :authenticate_user!
    before_action :get_larp
    before_action :authorize_user!
    before_action :get_asset, only: [:show, :edit, :update, :destroy]

    after_action :add_asset_to_user_last_seen_assets_infos, only: [:show, :edit, :update]
  end

  private

  def add_asset_to_user_last_seen_assets_infos
    asset_infos = {name: current_asset.name, path: polymorphic_path([@larp, current_asset])}
    last_seen_infos = user_last_seen_assets_infos larp: @larp
    last_seen_infos << asset_infos unless last_seen_infos.include?(asset_infos)
    last_seen_infos.shift if last_seen_infos.size > 10
  end

  def get_larp
    @larp = Larp.find params[:larp_id]
  end
end
