Justincampbell::Application.routes.draw do
  get 'blog'       => 'blog#index'
  get 'blog/:slug' => 'blog#show'
  
  namespace :admin do
    resources :posts
  end
end
