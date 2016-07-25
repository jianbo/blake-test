Rails.application.routes.draw do
  get 'student_progress/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ApiBase => '/'
end
