Rails.application.routes.draw do
  
  root 'projects#index'
  
  resources :static_pages, only: [:create]
  get 'legal', to: 'static_pages#legal_mentions'
  get 'donation', to: 'static_pages#donation'
  get 'about', to: 'static_pages#about'

  devise_for :users, :path => "/Mon_Profil"

  resources :users, except: [:new, :index, :create], path: "/Profil"
  resources :projects, :path => "/Projets" do
    resources :feats, except: [:index] ,:path => "/Feats"
  end
  resources :attachments, only: [:destroy]
  resources :likes, only: [:update]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  namespace :admin do
    root to: 'static_pages#index'
    resources :users, except: [:new, :create]
    resources :projects, except: [:new, :create] do
      resources :feats, only: [:update, :destroy, :index]
    end
    resources :skills, except: [:show]
  end

end
