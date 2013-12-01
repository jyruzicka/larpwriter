module HasName
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name

    scope :by_name, -> { order :name }

    before_save :normalize_name, if: :name_changed?

    def to_param
      "#{id}-#{name}".parameterize
    end

    private

    def normalize_name
      name.squish!
    end
  end
end
