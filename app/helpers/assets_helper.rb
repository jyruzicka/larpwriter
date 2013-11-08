module AssetsHelper

  def asset_type
    controller_name.chop.to_sym
  end

  # hackish but useful!
  def asset_record
    @asset_record ||= @organizer || @pc
  end

  def index_attribute_names asset_type
    case asset_type
    when :organizer then %i(first_name last_name email phone_numbers)
    when :pc        then %i(name)
    end
  end

end
