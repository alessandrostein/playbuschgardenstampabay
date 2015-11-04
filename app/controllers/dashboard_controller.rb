class DashboardController < InheritedResources::Base

  before_action :authenticate_user!

  before_action :set_menu_context, if: ->() { user_signed_in? }

  def set_menu_context
    @menu_context = actual_menu_context
  end

  def index
  end

  private

  def actual_menu_context
    :dashboard
  end

end
