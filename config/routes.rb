Rails.application.routes.draw do
  devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
  }

  get 'shopers/index'
  get 'shopers/new'
  get 'shopers/show'
  get 'shopers/edit'
  get 'shops/index'
  get 'shops/new'
  get 'shops/show'
  get 'shops/edit'
  get 'foodanswers/edit'

  resources :uploads
  resources :shops do
    resources :shopers
  end
  resources :foods do
    resources :foodanswers
  end
  resources :goods do
    resources :answers
  end
  root 'home#top'
  get 'home/about' => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
