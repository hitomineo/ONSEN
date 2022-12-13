Rails.application.routes.draw do

  root to: "public/homes#top"
  get 'about'=>'public/homes#about'

  devise_for :customer,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    patch 'customers_information' => 'customers#update', as:'information'
    resources :customers,only: [:show]
    get '/quit' => 'customers#quit', as:'quit'
    patch '/withdrawal' => 'customers#withdrawal', as:'withdrawal'
    resources :posts, only: [:index, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
