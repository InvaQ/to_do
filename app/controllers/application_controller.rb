class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_request
  private

  def invalid_request
    logger.error "attemt to access invalid page #{params[:id]}"
    redirect_to root_url, notice: "Invalid page"
  end
end
