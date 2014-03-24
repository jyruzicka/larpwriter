module ApplicationHelper
  def action_name_for_breadcrumb
    case action_name
    when "create" then "new"
    when "update" then "edit"
    else action_name
    end
  end

  def bootstrap_class_for flash_type # rubocop:disable MethodLength
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
end
