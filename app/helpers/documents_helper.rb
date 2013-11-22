module DocumentsHelper

  def asset_show_included_documents_section asset
    content_tag(:h3, "Included documents") +
    content_tag(:p, links_to_assets(asset.documents.by_name))
  end

end
