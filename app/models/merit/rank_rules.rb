# Be sure to restart your server when you modify this file.
#
# 5 stars is a common ranking use case. They are not given at specified
# actions like badges, you should define a cron job to test if ranks are to be
# granted.
#
# +set_rank+ accepts:
# * :+level+ ranking level (greater is better)
# * :+to+ model or scope to check if new rankings apply
# * :+level_name+ attribute name (default is empty and results in 'level'
#   attribute, if set it's appended like 'level_#{level_name}')

module Merit
  class RankRules
    include Merit::RankRulesMethods

    def initialize
      set_rank :level => 0, :to => User.all do |user|
        user.points > 0 && user.points < 250
      end

      set_rank :level => 1, :to => User.all do |user|
          user.points >= 250 && user.points < 500
      end

      set_rank :level => 2, :to => User.all do |user|
        user.points >= 500 && user.points < 1000
      end

      set_rank :level => 3, :to => User.all do |user|
        user.points >= 1000
      end
    end
  end
end
