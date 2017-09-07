set :css_dir, 'stylesheets'
set :images_dir, 'images'

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-5973800-7'
end

configure :build do
  activate :asset_hash
  activate :minify_css
end

configure :development do
  activate :livereload
end

helpers do
  def projects
    data.projects.sort_by(&:date).reverse
  end

  def tags
    data
      .projects
      .map(&:tags)
      .flatten
      .inject(Hash.new(0)) { |hash, tag| hash[tag] += 1; hash }
      .sort
  end
end
