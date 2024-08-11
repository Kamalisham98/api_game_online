class BaseController < ApplicationController
  # rescue_from Exception, with: :handle_internal_server_error
  rescue_from ::ErrorHandlers, with: :handles_errors

  private

  def handles_errors(e)
    render json: {
      status: e.status,
      error: e.error
    }, status: e.status
  end

  # def handle_internal_server_error(e)
  #   render json: {
  #     error: {
  #       title: 'Internal Server Error',
  #       message: 'Please try again later',
  #       exception: e
  #     }
  #   }, status: :internal_server_error
  # end
end
