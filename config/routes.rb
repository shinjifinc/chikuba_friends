Rails.application.routes.draw do

  root 'questionnaires#index'

  resource :questionnaire, only: [:index]

end
