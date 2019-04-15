class Post < ApplicationRecord

  include Sluggable
  validates_with PostValidator

end
