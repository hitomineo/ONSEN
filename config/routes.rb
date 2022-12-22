Rails.application.routes.draw do

# 管理者側
  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "admin/homes#top"
    resources :customers,only: [:index,:show] do
    end
  end




# 会員側

  root to: "public/homes#top"
  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#new_guest'
  end

  scope module: :public do
    patch 'customers_information' => 'customers#update', as:'information'
    resources :customers,only: [:create,:show,:index,:edit,:destroy]do
      member do
      get :favorites
    end
    end
    resources :stars, only: [:index,:create]
    get '/quit' => 'customers#quit', as:'quit'
    patch '/withdrawal' => 'customers#withdrawal', as:'withdrawal'
    get 'posts/search', to: 'posts#search'
    resources :posts, only: [:index,:create,:show,:edit,:update,:destroy ] do
      resource :likes, only: [:create,:destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
