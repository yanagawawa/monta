Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/trainer_about' => 'homes#trainer_about'

#deviseのルーティング
  devise_for :trainers,
    path: :trainer,
    controllers: {
      sessions: 'trainer/devise/sessions',
      passwords: 'trainer/devise/passwords',
      registrations: 'trainer/devise/registrations',
    }

  namespace :trainer do

    get 'trainers/history' => 'trainers#history'
    resources :trainers, only: [:show, :edit, :update]
    resources :lessons, only: [:new, :create, :edit, :update]
  end

  devise_for :users,
    controllers: {
      sessions: 'public/devise/sessions',
      passwords: 'public/devise/passwords',
      registrations: 'public/devise/registrations',
    }

  scope module: :public do

    resources :users, only: [:show, :edit, :update]
    get '/history' => 'users#history'
    resources :lesson_trainers, only: [:index, :show, :create]
    resources :lessons, only: [:index, :show]
    get '/calendar' => 'lessons#calendar'
    resources :relationships, only: [:create, :destroy]
    resources :reserves, only: [:create, :update, :destroy]

    resources :rooms, only: [:show, :index, :new, :create, :destroy] do
      resources :messages, only: [:create, :destroy]
    end

  end

end
