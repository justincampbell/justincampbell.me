class Project < ActiveRecord::Base
  attr_accessible :name, :published_at, :url

  default_scope do
    where("published_at is not null").order("published_at desc")
  end
end
