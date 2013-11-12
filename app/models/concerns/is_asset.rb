module IsAsset
  extend ActiveSupport::Concern

  included do
    include HasName

    belongs_to :larp
    validates_presence_of :larp_id
  end
end
