class Organizer < ActiveRecord::Base
  include IsAsset, HasFirstNameAndLastName

  belongs_to :user

  validates_presence_of   :email
  validates_format_of     :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email, scope: :larp_id
end
