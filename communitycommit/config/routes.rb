Rails.application.routes.draw do

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
 resources :users, :only => [:index,:show,:edit,:update]
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
resources :communities, :only => [:index,:show] do
 resource :belongs, only: [:create, :destroy]
 resources :posts, :only => [:index,:show] do
   resources :post_comments, only: [:create, :destroy]
 end
end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
