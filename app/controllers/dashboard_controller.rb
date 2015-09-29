class DashboardController < InheritedResources::Base

  before_action :authenticate_user!

  def index
  end
end
