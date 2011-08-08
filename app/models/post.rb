class Post < ActiveRecord::Base
  before_save :update_or_create_slug
  
  validates_uniqueness_of :title, :slug
  
  def to_param
    slug or title.parameterize
  end
  
  def update_or_create_slug
    self.slug = self.title.try(:parameterize)
  end
end
