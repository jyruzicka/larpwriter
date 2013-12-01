module HasFirstNameAndLastName
  extend ActiveSupport::Concern

  included do
    include HasName

    before_validation { |asset| asset.name = "#{first_name} #{last_name}".strip }

    validates_presence_of :first_name

    before_save :normalize_first_name_and_last_name

    private

    def normalize_first_name_and_last_name
      first_name.squish! if first_name_changed?
      last_name.squish!  if last_name_changed? && last_name.present?
    end
  end
end
