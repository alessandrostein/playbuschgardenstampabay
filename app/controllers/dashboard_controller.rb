class DashboardController < InheritedResources::Base

  before_action :authenticate_user!
  before_action :check_rank_rules
  before_action :set_menu_context, if: ->() { user_signed_in? }

  def set_menu_context
    @menu_context = actual_menu_context
  end

  def index
  end

  def ranking
  end

  def wins
  end

  def check_rank_rules
    Merit::RankRules.new.check_rank_rules
  end

  private

  def actual_menu_context
    :dashboard
  end

end
