class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :error, :success

  private

  def authorize_user!
    unless current_user.site_admin? || current_user.is_organizer_of?(@larp)
      redirect_to root_path, alert: "You are not authorized to access this page"
      false
    end
  end

  # hackish but useful!
  def current_asset # rubocop:disable CyclomaticComplexity
    @current_asset ||= @tag || @group || @pc || @npc || @player || @npc_player || @document || @organizer
  end
  helper_method :current_asset

  def user_last_seen_assets_infos larp: larp
    session[:last_seen_assets_infos] ||= {}
    session[:last_seen_assets_infos][larp.id] ||= []
  end
  helper_method :user_last_seen_assets_infos
end
