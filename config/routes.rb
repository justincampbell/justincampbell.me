Justincampbell::Application.routes.draw do
  root :to => 'projects#index'

  get 'blog/:slug' => 'blog#show'

  # Handle legacy Tumblr URLs
  get 'post/:tumblr_id/:slug' => 'blog#show'

  get 'resume' => 'resume#index'

  get 'til/new' => 'til#new', as: :til_new
  post 'til' => 'til#create', as: :til_create
  put 'til/preview' => 'til#preview', as: :til_preview
  put 'til/:slug' => 'til#update', as: :til_update
  get 'til' => 'til#index', as: :til_root
  get 'til/:slug' => 'til#show', as: :til_show
  get 'til/:slug/edit' => 'til#edit', as: :til_edit

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create', as: :authenticate
  get 'sign_out' => 'sessions#destroy', as: :sign_out
end
