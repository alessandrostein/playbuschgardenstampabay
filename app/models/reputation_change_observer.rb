class ReputationChangeObserver
  def update(changed_data)

    byebug
    if changed_data[:merit_object].is_a?Merit::Score::Point
      if Merit::Score.find(changed_data[:merit_object].score_id).try(:category).present?
        description = Merit::Score.find(changed_data[:merit_object].score_id).category
      else
        description = changed_data[:description]
      end
    else
      description = changed_data[:description]
    end

    # If user is your meritable model, you can query for it doing:
    user = User.where(sash_id: changed_data[:sash_id]).first

    # When did it happened:
    datetime = changed_data[:granted_at]
  end
end
