Rails.application.routes.draw do
  get 'static_pages/about'
  root 'projects#index'
  get '/about', to: 'static_pages#about', as: "a_propos"
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

end
