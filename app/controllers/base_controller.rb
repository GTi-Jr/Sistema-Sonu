class BaseController < ApplicationController
	layout "dashboard"
	before_action :authenticate_crew_admin!
	before_action :get_admin
end
