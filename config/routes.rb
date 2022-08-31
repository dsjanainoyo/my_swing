Rails.application.routes.draw do
  
  root to:'public/events#index'
  get 'events/show' => 'public/events#show'
  get 'musicians/index' => 'public/musicians#index'
  get 'musicians/show' => 'public/musicians#show'

 namespace :admin do
    resources :genres, only: [:index,:edit]
    resources :events, only: [:index,:show,:destroy]
    resources :users, only: [:index,:show,:withdrawal]
    resources :musicians, only: [:index,:show,:withdrawal]
    resources :genre_items, only: [:create,:edit,:update,:destroy]
    patch 'musicians/withdrawal'=>'musicians#withdrawal'
    
  end
  
  namespace :musician do
    resources :musicians, only: [:show,:edit,:update]
    patch 'musicians/withdrawal'=>'musicians#withdrawal'
    resources :events, only: [:index,:show,:new,:create,:edit,:update]
    get 'relationships/index'
    get 'comments/create'
  end
  
  namespace :public do
    resources :users, only: [:show,:edit,:update]
    patch 'users/withdrawal'=>'users#withdrawal'
    resources :events, only: [:index,:show]
    resources :musicians, only: [:index,:show]
    resources :reservations, only: [:new,:create,:index]
    get 'relationships/index'
    get 'favorites/index'
  end


  devise_for :musician,skip: [:passwords],controllers:{
    registrations: "musician/registrations",
    sessions: 'musician/sessions'
  }
  devise_for :user,skip: [:passwords],controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin,skip: [:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
