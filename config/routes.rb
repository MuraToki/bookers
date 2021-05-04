Rails.application.routes.draw do
  # get '/books/:id' => 'books#show'
  # get '/books' => 'books#index'
  # get '/books/:id/edit' => 'books#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top'
  resources :books, only: [:index, :create, :edit, :show, :update, :destroy]
end
