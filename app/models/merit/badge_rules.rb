# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # Badges for social
      grant_on 'tasks#share', badge: 'social_1', to: @task do |task|
        score_social_points_is_true(task.user, 100)
      end

      grant_on 'comments#create', badge: 'social_1', to: @comment do |comment|
        score_social_points_is_true(comment.user, 100)
      end

      grant_on 'posts#like', badge: 'social_1', to: @post do |post|
        score_social_points_is_true(post.user, 100)
      end

      grant_on 'tasks#share', badge: 'social_2', to: @task do |task|
        score_social_points_is_true(task.user, 200)
      end

      grant_on 'comments#create', badge: 'social_2', to: @comment do |comment|
        score_social_points_is_true(comment.user, 200)
      end

      grant_on 'posts#like', badge: 'social_2', to: @post do |post|
        score_social_points_is_true(post.user, 200)
      end

      grant_on 'tasks#share', badge: 'social_3', to: @task do |task|
        score_social_points_is_true(task.user, 300)
      end

      grant_on 'comments#create', badge: 'social_3', to: @comment do |comment|
        score_social_points_is_true(comment.user, 300)
      end

      grant_on 'posts#like', badge: 'social_3', to: @post do |post|
        score_social_points_is_true(post.user, 300)
      end

      grant_on 'tasks#share', badge: 'social_4', to: @task do |task|
        score_social_points_is_true(task.user, 400)
      end

      grant_on 'comments#create', badge: 'social_4', to: @comment do |comment|
        score_social_points_is_true(comment.user, 400)
      end

      grant_on 'posts#like', badge: 'social_4', to: @post do |post|
        score_social_points_is_true(post.user, 400)
      end

      grant_on 'tasks#share', badge: 'social_5', to: @task do |task|
        score_social_points_is_true(task.user, 500)
      end

      grant_on 'comments#create', badge: 'social_5', to: @comment do |comment|
        score_social_points_is_true(comment.user, 500)
      end

      grant_on 'posts#like', badge: 'social_5', to: @post do |post|
        score_social_points_is_true(post.user, 500)
      end

      # Badges for volunter
      grant_on 'actions#confirmate', badge: 'voluntario_1', to: @action do |action|
        score_volunter_points_is_true(action.user, 100)
      end

      grant_on 'actions#participate', badge: 'voluntario_1', to: @action do |action|
        score_volunter_points_is_true(action.user, 100)
      end

      grant_on 'actions#confirmate', badge: 'voluntario_2', to: @action do |action|
        score_volunter_points_is_true(action.user, 200)
      end

      grant_on 'actions#participate', badge: 'voluntario_2', to: @action do |action|
        score_volunter_points_is_true(action.user, 200)
      end

      grant_on 'actions#confirmate', badge: 'voluntario_3', to: @action do |action|
        score_volunter_points_is_true(action.user, 300)
      end

      grant_on 'actions#participate', badge: 'voluntario_3', to: @action do |action|
        score_volunter_points_is_true(action.user, 300)
      end

      grant_on 'actions#confirmate', badge: 'voluntario_4', to: @action do |action|
        score_volunter_points_is_true(action.user, 400)
      end

      grant_on 'actions#participate', badge: 'voluntario_4', to: @action do |action|
        score_volunter_points_is_true(action.user, 400)
      end

      grant_on 'actions#confirmate', badge: 'voluntario_5', to: @action do |action|
        score_volunter_points_is_true(action.user, 500)
      end

      grant_on 'actions#participate', badge: 'voluntario_5', to: @action do |action|
        score_volunter_points_is_true(action.user, 500)
      end
    end

    def score_social_points_is_true?(user, num_points)
      user.score_points.where("category in ('pontos por curtir uma publicação',
        'pontos por comentar uma publicação', 'pontos por compartilhar uma publicação')")
        .sum(:num_points) >= num_points
    end

    def score_volunter_points_is_true?(user, num_points)
      user.score_points.where("category in ('pontos por participar de uma ação',
        'pontos por finalizar uma ação')").sum(:num_points) >= num_points
    end
  end
end
