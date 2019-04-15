class Category < ApplicationRecord
  include Sluggable
  validates_with CategoryValidator
end
