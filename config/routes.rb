Rails.application.routes.draw do
  root 'static_pages#home'
  get '/todayall', to: 'static_pages#todayAll'
  get '/next7days', to: 'static_pages#next7days'
  get '/next7daysall', to: 'static_pages#next7daysAll'
  devise_for :users
  resources :projects, only: [:show, :create, :update, :destroy]
  get '/projects/:id/showAll', to: 'projects#showAll', as: :projectall
  resources :tasks, only: [:create, :update, :destroy]
  resources :tasks do
      post :toggleCompleted
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
