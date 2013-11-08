class Pc < ActiveRecord::Base
  belongs_to :larp

  validates_presence_of :name

  scope :by_name, -> { order :name }
end
