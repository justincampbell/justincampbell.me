Justincampbell::Application.routes.draw do
  root :to => 'projects#index'

  get 'blog/:slug' => 'blog#show'

  # Handle legacy Tumblr URLs
  get 'post/:tumblr_id/:slug' => 'blog#show'

  get 'resume' => 'resume#index'

  namespace :til do
    get '/new' => 'til#new', as: :new
    post '/' => 'til#create', as: :create
    post '/preview' => 'til#preview', as: :preview
    get '/' => 'til#index'
    get '/:slug' => 'til#show', as: :show
  end
end
