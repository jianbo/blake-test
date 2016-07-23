# encoding: utf-8
require 'grape'
require 'grape-entity'

class ApiBase < Grape::API

  # common Grape settings
  prefix 'api'
  version 'v1', using: :path
  format :json

  rescue_from :all, backtrace: false do |e|
    ApiBase.send_error_response(e)
  end

  mount Students::API

  helpers do
    def not_found!(message = '')
      error!({ status: 404, message: "Not Found. #{message} " }, 404)
    end
  end
end
