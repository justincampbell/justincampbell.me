Justincampbell::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => 'pages#index'

  get 'blog'       => 'blog#index'
  get 'blog/:slug' => 'blog#show'

  # Handle legacy Tumblr URLs
  get 'post/:tumblr_id/:slug' => 'blog#show'

  get 'resume' => 'resume#index'
end
