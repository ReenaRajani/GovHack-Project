Rails.application.routes.draw do
  root :to => 'pages#landing'
  post '/details' => 'pages#details'

  get '/toby' => 'pages#toby'

end
