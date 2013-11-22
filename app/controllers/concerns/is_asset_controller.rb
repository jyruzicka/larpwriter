module IsAssetController
  extend ActiveSupport::Concern

  included do
    layout "larps"

    before_action :authenticate_user!
    before_action :get_larp
    before_action :authorize_user!
    before_action :get_asset, only: [:show, :edit, :update, :destroy]

    after_action :add_asset_to_last_seen_asset_infos, only: [:show, :edit, :update]
  end

  private

  def add_asset_to_last_seen_asset_infos
    seen_asset_infos = [current_asset.name, polymorphic_path([@larp, current_asset])]
    session[:last_seen_asset_infos] ||= {}
    session[:last_seen_asset_infos][@larp.id] ||= []
    session[:last_seen_asset_infos][@larp.id] << seen_asset_infos unless session[:last_seen_asset_infos][@larp.id].include?(seen_asset_infos)
    session[:last_seen_asset_infos][@larp.id].shift if session[:last_seen_asset_infos][@larp.id].size > 5
  end

  def get_larp
    @larp = Larp.find params[:larp_id]
  end
end
