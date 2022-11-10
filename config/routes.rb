Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :movies
  resources :lists, only: %i[index show new create edit] do
    resources :bookmarks, only: %i[index new create edit]
  end
  resources :bookmarks, only: %i[destroy]
end
