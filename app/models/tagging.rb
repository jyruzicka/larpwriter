class Tagging < ActiveRecord::Base
  belongs_to :tag, counter_cache: true
  belongs_to :taggable, polymorphic: true

  validates_presence_of :tag_id

  after_destroy :destroy_tag_if_last_tagging

  private

  def destroy_tag_if_last_tagging
    tag.destroy if tag.taggings.count.zero?
  end
end
