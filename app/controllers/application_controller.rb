class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ErrorsHelper
  include SessionsHelper

  protect_from_forgery with: :exception

  before_filter :check_session

  private
    def check_session
      unless signed_in?
        @errors = generate_errors(User, { session: 'Invalid session' })
        render 'base/errors', status: 401
      end
    end

end
