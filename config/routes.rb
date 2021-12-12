Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users, :path => "/Mon_Profil"
  resources :projects, :path => "/Projets" do
    resources :feats, :path => "/Feats"
  end
  resources :attachements, only: [:destroy]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

end
