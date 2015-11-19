# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      score 5, :on => ['posts#like'],
        category: "pontos por curtir uma publicação"
      score 5, :on => ['comments#create'],
        category: "pontos por comentar uma publicação"
      score 10, :on => ['tasks#share'],
        category: "pontos por compartilhar uma publicação"
      score 10, :on => ['actions#participate'],
        category: "pontos por participar de uma ação"
      score 15, :on => ['actions#confirmate'],
        category: "pontos por finalizar uma ação"
    end
  end
end
