class Crew::AdminDashboardController < Crew::BaseController
before_action :authenticate_crew_admin!

  def index
  end
end
