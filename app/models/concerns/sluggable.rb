module Sluggable

  extend ActiveSupport::Concern

  included do
    
    before_validation :set_default_slug, on: [:create, :update]
    validates :slug,
      format: { with: /\A[a-z0-9]+\z/, message: "スラグが無効です" },
      uniqueness: { message: "そのナメクジはすでに撮影されています" }

    private
    def set_default_slug
      if !self.title.nil? && !self.title.empty? && (self.slug.nil? || self.slug.empty?)
        self.slug = self.title.parameterize 
      end
    end
  end

end