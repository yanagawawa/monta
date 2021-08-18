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
    resources :trainers, only: [:show, :edit, :update]
    get 'trainers/history' => 'trainers#history'
    resources :lessons, only: [:new, :create, :edit, :update]
  end

  devise_for :users,
    controllers: {
      sessions: 'public/devise/sessions',
      passwords: 'public/devise/passwords',
      registrations: 'public/devise/registrations',
    }

  scope module: :public do

    resources :lesson_trainers, only: [:index, :show, :create]
    resources :lessons, only: [:index, :show]
    get '/calendar' => 'lessons#calendar'
    resources :relationships, only: [:create, :destroy]
    resources :reserves, only: [:create, :update, :destroy]
  end

end
