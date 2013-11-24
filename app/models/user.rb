class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :organizers, dependent: :destroy
  has_many :larps, through: :organizers

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  after_create :associate_to_organizers_having_the_same_email

  def as_organizer_in_larp larp
    organizers.find_by_larp_id larp.id
  end

  def is_organizer_of? larp
    larps.include? larp
  end

  private

  def associate_to_organizers_having_the_same_email
    Organizer.where(email: email).update_all user_id: id
  end
end
