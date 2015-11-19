Merit::Badge.create!(
  id: 1,
  name: "social_1",
  description: "Você foi recompensado com 1 estrela"
)
Merit::Badge.create!(
  id: 2,
  name: "social_2",
  description: "Você foi recompensado com 2 estrelas"
)
Merit::Badge.create!(
  id: 3,
  name: "social_3",
  description: "Você foi recompensado com 3 estrelas"
)
Merit::Badge.create!(
  id: 4,
  name: "social_4",
  description: "Você foi recompensado com 4 estrelas"
)
Merit::Badge.create!(
  id: 5,
  name: "social_5",
  description: "Você recebeu o trófeu Social. Parabéns!"
)

Merit::Badge.create!(
  id: 6,
  name: "voluntario_1",
  description: "Você foi recompensado com 1 estrela"
)
Merit::Badge.create!(
  id: 7,
  name: "voluntario_2",
  description: "Você foi recompensado com 2 estrelas"
)
Merit::Badge.create!(
  id: 8,
  name: "voluntario_3",
  description: "Você foi recompensado com 3 estrelas"
)
Merit::Badge.create!(
  id: 9,
  name: "voluntario_4",
  description: "Você foi recompensado com 4 estrelas"
)
Merit::Badge.create!(
  id: 10,
  name: "voluntario_5",
  description: "Você recebeu o trófeu Voluntário. Parabéns!"
)

grant_on ['tasks#share', 'comments#create', 'posts#like'],
  badge: 'social_1', to: :action_user do |user|
  user.score_points.where("category in ('pontos por curtir uma publicação',
    'pontos por comentar uma publicação', 'pontos por compartilhar uma publicação')")
    .sum(:num_points) >= 100
end

grant_on ['tasks#share', 'comments#create', 'posts#like'],
  badge: 'social_2' do |user|
  current_user.score_points.where("category in ('pontos por curtir uma publicação',
    'pontos por comentar uma publicação', 'pontos por compartilhar uma publicação')")
    .sum(:num_points) >= 200
end

grant_on ['tasks#share', 'comments#create', 'posts#like'],
  badge: 'social_3' do |user|
  current_user.score_points.where("category in ('pontos por curtir uma publicação',
    'pontos por comentar uma publicação', 'pontos por compartilhar uma publicação')")
    .sum(:num_points) >= 300
end

grant_on ['tasks#share', 'comments#create', 'posts#like'],
  badge: 'social_4' do |user|
  current_user.score_points.where("category in ('pontos por curtir uma publicação',
    'pontos por comentar uma publicação', 'pontos por compartilhar uma publicação')")
    .sum(:num_points) >= 400
end

grant_on ['tasks#share', 'comments#create', 'posts#like'],
  badge: 'social_5' do |user|
  current_user.score_points.where("category in ('pontos por curtir uma publicação',
    'pontos por comentar uma publicação', 'pontos por compartilhar uma publicação')")
    .sum(:num_points) >= 500
end

grant_on ['actions#participate', 'actions#confirmate'],
  badge: 'voluntario_1' do |user|
  current_user.score_points.where("category in ('pontos por participar de uma ação',
    'pontos por finalizar uma ação')").sum(:num_points) >= 100
end

grant_on ['actions#participate', 'actions#confirmate'],
  badge: 'voluntario_2' do |user|
  current_user.score_points.where("category in ('pontos por participar de uma ação',
    'pontos por finalizar uma ação')").sum(:num_points) >= 200
end

grant_on ['actions#participate', 'actions#confirmate'],
  badge: 'voluntario_3' do |user|
  current_user.score_points.where("category in ('pontos por participar de uma ação',
    'pontos por finalizar uma ação')").sum(:num_points) >= 300
end

grant_on ['actions#participate', 'actions#confirmate'],
  badge: 'voluntario_4' do |user|
  current_user.score_points.where("category in ('pontos por participar de uma ação',
    'pontos por finalizar uma ação')").sum(:num_points) >= 400
end

grant_on ['actions#participate', 'actions#confirmate'],
  badge: 'voluntario_5' do |user|
  current_user.score_points.where("category in ('pontos por participar de uma ação',
    'pontos por finalizar uma ação')").sum(:num_points) >= 500
end





Merit::Badge.create!(
  id: 7,
  name: "approved_oportunity",
  description: "Conclui uma ação social.",
  custom_fields: { category: :help, difficulty: :normal }
)

Merit::Badge.create!(
  id: 8,
  name: "five_approved_oportunity",
  description: "Conclui 5 oportunidades.",
  custom_fields: { category: :help, difficulty: :hard }
)

Merit::Badge.create!(
  id: 9,
  name: "one_month_user",
  description: "Faz parte a 1 mês.",
  custom_fields: { category: :site, difficulty: :normal }
)

Merit::Badge.create!(
  id: 10,
  name: "one_year_user",
  description: "Faz parte a 1 ano.",
  custom_fields: { category: :site, difficulty: :hard }
)

Merit::Badge.create!(
  id: 11,
  name: "share_social",
  description: "Compartilhou uma oportunidade nas Redes Socias.",
  custom_fields: { category: :site, difficulty: :easy }
)
