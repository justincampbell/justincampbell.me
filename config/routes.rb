Justincampbell::Application.routes.draw do
  root :to => 'pages#index'

  get 'blog'       => 'blog#index'
  get 'blog/:slug' => 'blog#show'

  # Handle legacy Tumblr URLs
  get 'post/:tumblr_id/:slug' => 'blog#show'

  get 'resume' => 'resume#index'

  namespace :admin do
    root :to => 'admin#index'
    resources :posts
  end
end
