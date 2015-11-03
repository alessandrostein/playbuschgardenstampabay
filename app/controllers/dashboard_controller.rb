class DashboardController < InheritedResources::Base

  before_action :authenticate_user!

  def index
  end

  private

  def actual_menu_context
    :dashboard
  end

end
