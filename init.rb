require 'redmine'

Redmine::Plugin.register :redmine_auto_private_notes_and_issues do
  name 'Redmine Auto Private Notes and Issues Plugin'
  author 'Barnabas (BSi) Bona'
  description 'Automatically set the private notes and private issue checkbox for selected users'
  version '1.1.0'
  url 'https://github.com/bsibsi/redmine_auto_private_notes_and_issues'
  author_url 'https://github.com/bsibsi/'

  # Plugin settings
  settings default: {
    'note_role_ids' => [],
    'issue_role_ids' => []
  }, partial: 'settings/auto_private_notes_and_issues_settings'

  # Register hook listener
  require_relative 'lib/auto_private_notes_and_issues/hook_listener'
end
