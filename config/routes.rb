AdoptAThing::Application.routes.draw do
  devise_for :users, :controllers => {
    passwords: 'passwords',
    registrations: 'users',
    sessions: 'sessions',
  }

  get '/address', to: 'addresses#show', as: 'address'
  get '/info_window', to:'info_window#index', as: 'info_window'
  get '/sitemap', to: 'sitemaps#index', as: 'sitemap'
  namespace :admin do
	get 'trees', to: 'trees#index', as: 'admin/trees'
	get 'trees/import', to: 'trees#import', as: 'admin/trees/import'
	get 'trees/new', to: 'trees#new', as: 'admin/trees/new'
	get 'trees/create', to: 'trees#create', as: 'admin/trees/create'
	get 'trees/delete/:id', to: 'trees#delete', as: 'admin/trees/delete'
	get 'users', to: 'users#index', as: 'admin/users'
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
