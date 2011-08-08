Justincampbell::Application.routes.draw do
  root :to => 'pages#index'
  
  get 'blog'       => 'blog#index'
  get 'blog/:slug' => 'blog#show'
  
  namespace :admin do
    root :to => 'admin#index'
    resources :posts
  end
end
