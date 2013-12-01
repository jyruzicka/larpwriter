module IsTaggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggings

    attr_writer :tags_string

    before_save :update_taggings_from_tags_string

    def tags_string
      instance_variable_get("@tags_string") || tags.by_name.pluck(:name).join(", ")
    end
  end

  private

  def update_taggings_from_tags_string
    self.tags_string ||= ""

    existing_tag_names = tags.pluck :name
    assigned_tag_names = tags_string.split(",").map(&:squish).reject(&:blank?).uniq

    associate_to_tags(assigned_tag_names - existing_tag_names)
    dissociate_from_tags(existing_tag_names - assigned_tag_names)
  end

  def associate_to_tags new_tag_names
    new_tag_names.each do |tag_name|
      tag = larp.tags.find_or_create_by! name: tag_name
      taggings.build tag: tag
    end
  end

  def dissociate_from_tags removed_tag_names
    removed_tag_names.each do |tag_name|
      tag = larp.tags.find_by_name tag_name
      taggings.find_by_tag_id(tag.try :id).try :destroy
    end
  end
end
