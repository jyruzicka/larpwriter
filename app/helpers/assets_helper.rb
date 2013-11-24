module AssetsHelper

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

  def links_to_asset_show_and_edit asset, attribute: :name
    link_to(asset.send(attribute), [@larp, asset]) +
    " " +
    link_to([:edit, @larp, asset], class: "asset-edit-link") { content_tag :span, "", class: "glyphicon glyphicon-pencil" }
  end

  def links_to_assets assets
    assets.map { |asset| link_to asset.name, [@larp, asset] }.to_sentence.html_safe
  end
end
