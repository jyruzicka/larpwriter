module IsSortable
  extend ActiveSupport::Concern

  included do
    include RankedModel

    def update_position! position
      self.class.record_timestamps = false
      update_attributes! rank_position: position
    ensure
      self.class.record_timestamps = true
    end
  end
end
