module IsAsset
  extend ActiveSupport::Concern

  included do
    include HasName
    validates_uniqueness_of :name, scope: :larp_id

    belongs_to :larp
    validates_presence_of :larp_id
  end
end
