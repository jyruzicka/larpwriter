module ApplicationHelper

  def action_name_for_breadcrumb
    case action_name
    when "create" then "new"
    when "update" then "edit"
    else action_name
    end
  end

  # hackish but useful!
  def asset_record
    @asset_record ||= @organizer
  end

  def bootstrap_class_for flash_type
    case flash_type
    when :success
      "alert-success"
    when :error
      "alert-danger"
    when :alert
      "alert-warning"
    when :notice
      "alert-info"
    else
      flash_type.to_s
    end
  end

  def page_title title, options={}
    content_for :page_title, title
    content_tag(:h1, title) unless options[:without_heading]
  end
end
