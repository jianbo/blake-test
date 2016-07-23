class ApplicationController < ActionController::ApiBase
  protect_from_forgery with: :exception
end
