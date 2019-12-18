class ApplicationController < ActionController::Base
  # protect_from_forgery prepend: true, only: proc { |c| c.request.format.json? }
  protect_from_forgery

  before_action :authenticate_user!
  include SessionsHelper
end
