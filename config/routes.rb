Rails.application.routes.draw do
  root 'templated_emails#index'
  resources :templated_emails

  resources :message_templates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
