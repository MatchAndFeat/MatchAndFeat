Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users, :path => "/Mon_Profil"

  resources :projects, :path => "/Mes_projets" do
    resources :feats, :path => "/Mes_feats"
  end

end
