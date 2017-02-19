# frozen_string_literal: true
Rails.application.routes.draw do
  resources :notes, except: [:new, :edit]
  resources :ideas, except: [:new, :edit]
  # resources :giftees, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  post '/giftee' => 'giftees#create'
  delete '/giftee/:id' => 'giftees#destroy'
  get '/giftee/' => 'giftees#index'
  get '/giftee/:id' => 'giftees#show'
  resources :users, only: [:index, :show]
end
