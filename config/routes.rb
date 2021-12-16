Rails.application.routes.draw do
  
  root 'projects#index'

  get 'legal', to: 'static_pages#legal_mentions'
  
  resources :static_pages, :path => "/a_propos", only: [:index, :new, :create]

  devise_for :users, :path => "/Mon_Profil"

  resources :users
  resources :projects, :path => "/Projets" do
    resources :feats, :path => "/Feats" do
    end
  end
  resources :attachements, only: [:destroy]
  resources :likes, only: [:update]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  namespace :admin do
    root to: 'static_pages#index'
    resources :users
    resources :projects do
      resources :feats
    end
    resources :skills
  end

end
