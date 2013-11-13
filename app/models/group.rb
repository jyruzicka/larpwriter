class Group < ActiveRecord::Base
  include IsAsset, HasAttachedPicture

  belongs_to :larp
end
