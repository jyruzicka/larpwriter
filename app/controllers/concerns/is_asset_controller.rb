module IsAssetController
  extend ActiveSupport::Concern

  included do
    layout "larps"

    before_action :authenticate_user!
    before_action :get_larp
    before_action :authorize_user!
    before_action :get_asset, only: [:show, :edit, :update, :destroy]
  end

  def get_larp
    @larp = Larp.find params[:larp_id]
  end
end
