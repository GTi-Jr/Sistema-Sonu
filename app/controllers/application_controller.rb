class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_user
    @user = current_user
  end
  #load_and_authorize_resource   # GET /sonu_events
end
