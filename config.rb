set :css_dir, 'stylesheets'
set :images_dir, 'images'

configure :build do
  activate :asset_hash
  activate :minify_css
end

configure :development do
  activate :livereload
end
