Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users, :path => "/Mon_Profil"
  resources :projects, :path => "/Projets" do
    resources :feats, :path => "/Feats"
  end
  resources :attachements, only: [:destroy]
end
