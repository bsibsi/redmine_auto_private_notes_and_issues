module AutoPrivateNotes
  class HookListener < Redmine::Hook::ViewListener
    def view_issues_edit_notes_bottom(context = {})
      user = User.current
      issue = context[:issue]
      project = issue&.project
      return '' unless user.logged? && project

      setting_role_ids = Setting.plugin_redmine_auto_private_notes['role_ids'] || []
      membership = user.membership(project) rescue nil
      user_role_ids = membership ? membership.roles.map(&:id).map(&:to_s) : []

      match_found = (setting_role_ids & user_role_ids).any?

      if match_found
        <<~HTML.html_safe
          <script>
            document.addEventListener('DOMContentLoaded', function () {
              var checkbox = document.getElementById('issue_private_notes');
              if (checkbox) checkbox.checked = true;
            });
          </script>
        HTML
      else
        ''
      end
    end
  end
end
