Justincampbell::Application.routes.draw do
  root :to => 'projects#index'

  get 'blog/:slug' => 'blog#show'

  # Handle legacy Tumblr URLs
  get 'post/:tumblr_id/:slug' => 'blog#show'

  get 'resume' => 'resume#index'

  namespace :admin do
    root :to => 'admin#index'
    resources :posts
  end
end
