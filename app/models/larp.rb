class Larp < ActiveRecord::Base
  has_many :organizers, dependent: :destroy

  validates_presence_of :name

  normalize_attributes :name
end
