Justincampbell::Application.routes.draw do
  root to: 'projects#index'

  get 'burritos' => 'pages#burritos'
  get 'hire' => 'pages#hire'

  get 'blog/:slug' => 'blog#show'

  # Handle legacy Tumblr URLs
  get 'post/:tumblr_id/:slug' => 'blog#show'

  # Handle legacy TIL URLs
  get 'til.atom', to: redirect('http://til.justincampbell.me/index.atom')
  get 'til', to: redirect('http://til.justincampbell.me')
  get 'til/:slug', to: redirect("http://til.justincampbell.me/%{slug}")

  get 'resume' => 'resume#index'

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create', as: :authenticate
  get 'sign_out' => 'sessions#destroy', as: :sign_out
end
