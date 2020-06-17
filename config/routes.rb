Rails.application.routes.draw do
  
  	root 'static_pages#home'
	get 'help' => 'static_pages#help'
	get 'about' => 'static_pages#about'
	get 'contact' => 'static_pages#contact'
	get 'signup' => 'users#new'
	resources :users
	get 'login' => 'sessions#new'
	post'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users do
		member do
			get :following, :followers
		end
	end

  resources :microposts, only: [:create, :show, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :destroy]
end
