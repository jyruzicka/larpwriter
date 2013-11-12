module HasName
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name

    scope :by_name, -> { order :name }

    normalize_attributes :name

    def to_param
      "#{id}-#{name}".parameterize
    end
  end
end
