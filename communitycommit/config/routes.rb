Rails.application.routes.draw do

  resources :questionary_results
  resources :questionary_choices
  resources :questionary_items
  resources :questionaries
  
  get 'questionary_results/calc/:id', to: 'questionary_results#calc'
  get 'questionary_choices/new/:id', to: 'questionary_choices#new'
  get 'questionary_items/new/:id', to: 'questionary_items#new'
  post 'questionaries/:id', to: 'questionaries#sendform'
  
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'communities/index'
  get 'communities/show'
  get 'communities/new'
  get 'communities/edit'

root to: 'homes#top'

devise_for :admins, controllers: {
sessions:      'admins/sessions',
passwords:     'admins/passwords',
registrations: 'admins/registrations'
}
get "communities/belonged" => "communities#belonged"

namespace :admins do
 resources :users, :only => [:show]
 resources :communities do
  resources :posts do
   resources :post_comments, only: [:show, :index]
  end
 end
end

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
namespace :users do
resources :users ,:only => [:show, :edit,:update]  
get '/search', to: 'search#search'
resources :communities, :only => [:index,:show] do
 resource :belongs, only: [:create, :destroy]
 resources :posts, :only => [:index,:show] do
   resources :post_comments, only: [:create, :destroy]
 end
end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
