require 'redmine'

Redmine::Plugin.register :redmine_auto_private_notes do
  name 'Redmine Auto Private Notes Plugin'
  author 'Barnabas (BSi) Bona'
  description 'Automatically checks the private notes box for selected users'
  version '1.0.0'
  url 'https://github.com/bsibsi/redmine_auto_private_notes'
  author_url 'https://github.com/bsibsi/'

  # Plugin settings
  settings default: { 'role_ids' => [] }, partial: 'settings/auto_private_notes_settings'

  # Register hook listener
  require_relative 'lib/auto_private_notes/hook_listener'
end
