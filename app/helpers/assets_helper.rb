module AssetsHelper

  def asset_type
    controller_name.chop.to_sym
  end

  # hackish but useful!
  def current_asset
    @current_asset ||= @organizer || @pc || @player
  end

  def index_attribute_names asset_type
    case asset_type
    when :pc        then %i(player_picture name player_name)
    when :player    then %i(picture first_name last_name email phone_numbers)
    when :organizer then %i(first_name last_name email phone_numbers)
    end
  end

  def links_to_assets assets
    assets.map { |asset| link_to asset.name, [@larp, asset] }.to_sentence.html_safe
  end
end
