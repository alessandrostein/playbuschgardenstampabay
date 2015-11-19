# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
end
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

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
