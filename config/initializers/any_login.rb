AnyLogin.setup do |config|
  # Provider (:devise, :authlogic, sorcery, clearance). Provider can be
  # identified automatically based on your Gemfile
  config.provider = :devise

  # Enabled or not
  config.enabled = Rails.env.development?

  # Account, User, Person, etc
  config.klass_name = 'Member'

  # .all, .active, .admins, .groped_collection, etc...
  # need to return an array (or hash with arrays) of users
  config.collection_method = :active

  # Format user name in dropdown list
  config.name_method = ->(member) { [member.full_name, member.id] }

  # After logging in redirect user to path
  config.redirect_path_after_login = :upcoming_events_path

  # login on select change event OR click on button, or BOTH
  config.login_on = :both

  # Position of any_login box :top_left, :top_right, :bottom_left, :bottom_right
  config.position = :bottom_right

  # Label on Login button
  config.login_button_label = 'Switch'

  # Prompt message in select
  config.select_prompt = "Select #{AnyLogin.klass_name}"

  # Show any_login box by default
  config.auto_show = false

  # Limit: integer or `:none`
  config.limit = 10

  # Enable http basic authentication
  config.http_basic_authentication_enabled = false

  # Enable http basic authentication
  config.http_basic_authentication_user_name = 'any_login'

  # Enable http basic authentication
  config.http_basic_authentication_password = 'password'

  # Use controller proc condition
  # config.verify_access_proc = proc do |controller|
  #   controller.current_member.try :holds_position?, 'Webmaster'
  # end
end
