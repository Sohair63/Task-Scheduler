class Api::ApiController < ApplicationController
  AUTH_TOKEN = "195b4a5bb185ef3f43dc5288b79386be"

  before_filter :ensure_has_the_right_headers

  private

  def render_api(response)
    api_response = {
      status: 'success',
    }.merge(response)

    response_code = api_response[:status] == 'failure' && 404 || 200

    render json: api_response, status: response_code
  end

  def render_api_error(response)
    response[:status] = 'failure'
    render_api(response)
  end

  def ensure_has_the_right_headers
    head :unauthorized unless request && request.headers && request.headers['Authorization'] && request.headers['Authorization']==AUTH_TOKEN
  end
end
