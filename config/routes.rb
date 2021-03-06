Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home' => "static_pages#home"
  get 'help' => "static_pages#help"
  get 'about' => "static_pages#about"
  get 'contact' => "static_pages#contact"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'signup' => 'users#new'
  get  'login' => 'sessions#new'
  post  'login' => 'sessions#create'
  delete  'logout' => 'sessions#destroy'
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  get '/search', to: 'searchs#search'
  get 'tweet/:id' => 'tweets#show'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end  

end