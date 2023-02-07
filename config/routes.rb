Rails.application.routes.draw do
  resources :users
  get 'home/index'

  # resources :users do
  #   patch :toggle_initial
  #   patch :toggle_middterm
  #   patch :toggle_exit
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do

    patch :toggler

  end

end
