Rails.application.routes.draw do
  
  root to:'public/events#index'
  get 'events/show' => 'public/events#show'
  get 'musicians/index' => 'public/musicians#index'
  get 'musicians/show' => 'public/musicians#show'

 namespace :admin do
    resources :genres, only: [:index,:edit]
    resources :events, only: [:index,:show,:destroy]
    resources :users, only: [:index,:show] 
    patch 'users/:id/withdrawal' => 'users#withdrawal', as: 'users_withdrawal'
    resources :musicians, only: [:index,:show] 
    patch 'musicians/:id/withdrawal'=>'musicians#withdrawal'  ,as: 'musicians_withdrawal'
    resources :genre_items, only: [:create,:edit,:update,:destroy]
    
    
  end
  
  namespace :musician do
    resources :musicians, only: [:show,:edit,:update]
    patch 'musicians/:id/withdrawal'=>'musicians#withdrawal'
    resources :events, only: [:index,:show,:new,:create,:edit,:update] do
      resources :comments, only: [:create]
    end
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  namespace :public do
    resources :users, only: [:show,:edit,:update]
    patch 'users/:id/withdrawal'=>'users#withdrawal'
    resources :events, only: [:index,:show] do 
      resources :reservations, only: [:new,:create,:destroy]
      resources :comments, only: [:create]
      resource :favorites, only: [:create,:destroy]
    end
    get 'reservations/index'
    resources :musicians, only: [:index,:show] do
      resources :relationships, only: [:create,:destroy]
    end
    
    get 'relationships' => 'relationships#followings', as: 'followings'
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
