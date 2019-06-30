Rails.application.routes.draw do
  devise_for :users
  require 'resque/server'
  mount Resque::Server, at: '/resque'
  mount ActionCable.server => '/cable'
  resources :policies
  resources :companies
  resources :employees
  resources :bulk_employee_uploads do
    member do
      get 'employees' => 'bulk_employee_uploads#employees_index', as: :employees
      get 'errors' => 'bulk_employee_uploads#errors_index', as: :errors
      get 'errors/generate_csv' => 'bulk_employee_uploads#generate_csv', as: :generate_csv
    end
  end

  root to: 'bulk_employee_uploads#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
