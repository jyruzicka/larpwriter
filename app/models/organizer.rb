class Organizer < ActiveRecord::Base
  include HasFirstNameAndLastName

  belongs_to :larp
  belongs_to :user

  validates_presence_of   :first_name, :larp_id, :email
  validates_format_of     :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email, scope: :larp_id
end
