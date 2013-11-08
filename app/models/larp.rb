class Larp < ActiveRecord::Base
  has_many :organizers, dependent: :destroy

  validates_presence_of :name

  scope :by_name, -> { order :name }

  normalize_attributes :name
end
