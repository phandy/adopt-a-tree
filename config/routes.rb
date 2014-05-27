AdoptAThing::Application.routes.draw do
  devise_for :users, :controllers => {
    passwords: 'passwords',
    registrations: 'users',
    sessions: 'sessions',
  }

  get '/address', to: 'addresses#show', as: 'address'
  get '/info_window', to:'info_window#index', as: 'info_window'
  get '/sitemap', to: 'sitemaps#index', as: 'sitemap'
  get '/things/pledge/:id', to:'things#pledge', as: 'pledge'
  namespace :admin do
	get 'trees/import', to: 'trees#import', as: 'admin/trees/import'
	get 'trees/delete/:id', to: 'trees#delete', as: 'admin/trees/delete/'
	resources :trees
	get 'users', to: 'users#index', as: 'admin/users'
	get 'users/export', to: 'users#export', as: 'admin/users/export'
	get 'users/:id', to: 'users#show', as: 'admin/users/'
    get '', to: 'dashboard#index', as: 'dashboard'
  end
  
  scope '/sidebar', controller: :sidebar do
    get :search, as: 'search'
    get :combo_form, as: 'combo_form'
    get :edit_profile , as: 'edit_profile'
  end

  resource :reminders
  resource :things
  resource :species
  mount RailsAdmin::Engine => '/admin2', as: 'rails_admin'
  root to: 'main#index'
end
