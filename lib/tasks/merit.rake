namespace :merit do
  task check_rank_rules: :environment do
    Merit::RankRules.new.check_rank_rules
  end
end
