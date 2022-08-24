Rails.application.routes.draw do

 namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update,:destroy]
    resources :events, only: [:index,:show,:destroy]
    resources :users, only: [:index,:show,:withdrawal]
    resources :musicians, only: [:index,:show,:withdrawal]
    
  end
  
  namespace :musician do
    resources :musicians, only: [:show,:edit,:update]
    resources :events, only: [:index,:show,:new,:create,:edit,:update]
    get 'relationships/index'
    get 'favorites/index'
    get 'comments/create'
  end
  
  namespace :public do
    resources :users, only: [:show,:edit,:update,:withdrawal]
    resources :events, only: [:index,:show]
    resources :musicians, only: [:index,:show]
    resources :reservations, only, [:new,:create,:index]
    get 'relationships/index'
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
