Rails.application.routes.draw do

  get 'welcome/index'
  post 'welcome/index'


  get 'tags/:tag', to: 'pins#index', as: :tag
  devise_for :users
  resources :searches
  resources :friends
  resources :activities
  resources :follows do
    collection do
      get 'create'
    end
  end
 
  resources :users do
    collection do
      get 'show'
      get 'profile'
      get 'show1'
    end
  end

  resources :pins do
  	resources :homes, only: [:show]
    root to: "homes#show"
  	resources :cs
    
   collection do
      get 'show1'
      get 'page'
    end
  	member do
  		put "like",to: "pins#upvote"
      put "dislike",to: "pins#downvote"
  	end
    get 'tags/:tag', to: 'pins#index', as: :tag
  end

root "pins#index"
end
