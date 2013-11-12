module HasFirstNameAndLastName
  extend ActiveSupport::Concern

  included do
    include HasName

    before_validation { |asset| asset.name = "#{first_name} #{last_name}".strip }

    validates_presence_of :first_name

    normalize_attributes :first_name, :last_name
  end
end
