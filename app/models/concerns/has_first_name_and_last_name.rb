module HasFirstNameAndLastName
  extend ActiveSupport::Concern

  included do
    scope :by_name, -> { order "first_name, last_name" }

    normalize_attributes  :first_name, :last_name
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end
