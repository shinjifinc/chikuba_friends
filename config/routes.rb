Rails.application.routes.draw do

  root 'questionnaires#index'

  resource :questionnaires, only: [:index] do
    get 'form_response'
  end
  resources :results, only: [:index]

end
