class Til < ActiveRecord::Base
  attr_accessible :body, :slug

  def to_param
    slug
  end
end
