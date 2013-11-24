class Organizer < ActiveRecord::Base
  include IsAsset, HasFirstNameAndLastName, IsTaggable

  belongs_to :user

  validates_presence_of   :email
  validates_format_of     :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email, scope: :larp_id

  after_create :associate_to_user_having_the_same_email, unless: :user_id

  def has_account?
    !!user_id
  end

  private

  def associate_to_user_having_the_same_email
    if user = User.find_by_email(email)
      update_column :user_id, user.id
    end
  end
end
