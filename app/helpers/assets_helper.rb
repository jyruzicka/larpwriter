module AssetsHelper

  def asset_type
    controller_name.chop.to_sym
  end

  # hackish but useful!
  def current_asset
    @current_asset ||= @tag || @group || @pc || @npc || @player || @npc_player || @document || @organizer
  end

  def current_asset_model_name
    controller_name.chop.camelize.constantize.model_name.human
  end

  def display_description description
    if description.present?
      simple_format description
    else
      content_tag :span, "no description given", class: "info"
    end
  end

  def index_attribute_names asset_type
    case asset_type
    when :group      then %i(attached_picture name memberships_count)
    when :pc         then %i(picture name player_or_npc_player_name group_names)
    when :npc        then %i(picture name player_or_npc_player_name group_names)
    when :player     then %i(attached_picture first_name last_name email phone_numbers)
    when :npc_player then %i(attached_picture first_name last_name email phone_numbers)
    when :document   then %i(name file)
    when :organizer  then %i(first_name last_name email phone_numbers)
    end
  end

  def links_to_assets assets
    assets.map { |asset| link_to asset.name, [@larp, asset] }.to_sentence.html_safe
  end
end
