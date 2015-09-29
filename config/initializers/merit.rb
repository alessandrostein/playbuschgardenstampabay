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
  name: "new_user",
  description: "Pelo seu interesse, você merece um prêmio.",
  custom_fields: { category: :site, difficulty: :easy }
)

Merit::Badge.create!(
  id: 2,
  name: "add_avatar",
  description: "Adicionou seu próprio avatar.",
  custom_fields: { category: :site, difficulty: :easy }
)

Merit::Badge.create!(
  id: 3,
  name: "publish_timeline",
  description: "Publicou na sua TimeLine.",
  custom_fields: { category: :site, difficulty: :easy }
)

Merit::Badge.create!(
  id: 4,
  name: "comment_timeline",
  description: "Comentou uma publicação na TimeLine.",
  custom_fields: { category: :site, difficulty: :easy }
)

Merit::Badge.create!(
  id: 5,
  name: "create_oportunity",
  description: "Criou uma nova oportunidade.",
  custom_fields: { category: :site, difficulty: :easy }
)

Merit::Badge.create!(
  id: 6,
  name: "participate_oportunity",
  description: "Se candidatou a uma oportunidade.",
  custom_fields: { category: :help, difficulty: :normal }
)

Merit::Badge.create!(
  id: 7,
  name: "approved_oportunity",
  description: "Conclui uma oportunidade.",
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
