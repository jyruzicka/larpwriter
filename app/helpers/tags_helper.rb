module TagsHelper

  def asset_show_tags_section asset
    if asset.tags.any?
      content_tag(:label, "Tags") + content_tag(:p, display_tags(asset.tags))
    end
  end

  def display_tags tags, with_line_breaks: false, with_count: false
    tags.by_name.map do |tag|
      link_to [@larp, tag], class: "tag" do
        tag_span tag, with_count: with_count
      end
    end.join("#{'<br />' if with_line_breaks}").html_safe
  end

  def tag_span tag, with_count: false
    content = tag.name
    content +=  " " + content_tag(:span, tag.taggings_count, class: "badge badge-tag-count") if with_count
    content_tag :span, content.html_safe, class: "label", style: "background-color: #{tag.color}"
  end

  def tags_input form
    hint = "to add a tag, type its name and press RETURN"
    hint += " ; <a href='#' id='see-tags' data-content='#{display_tags @larp.tags, with_line_breaks: true}'>see existing tags</a>" if @larp.tags.any?
    form.input :tags_string, label: "Tags", hint: hint.html_safe, input_html: { data: { role: "tagsinput" } }
  end

end
