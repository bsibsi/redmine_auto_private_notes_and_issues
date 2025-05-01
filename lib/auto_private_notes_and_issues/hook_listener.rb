module AutoPrivateNotesAndIssues
  class HookListener < Redmine::Hook::ViewListener

    # Add notes to issues (auto private notes)
    #
    def view_issues_edit_notes_bottom(context = {})
      user = User.current
      issue = context[:issue]
      project = issue&.project
      return '' unless user.logged? && project

      setting_note_role_ids = Setting.plugin_redmine_auto_private_notes_and_issues['note_role_ids'] || []
      membership = user.membership(project) rescue nil
      user_role_ids = membership ? membership.roles.map(&:id).map(&:to_s) : []

      match_found = (setting_note_role_ids & user_role_ids).any?

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

    # Add new issues (auto private issues)
    #
    def view_issues_form_details_bottom(context = {})
      user = User.current
      issue = context[:issue]
      project = issue&.project
      return '' unless user.logged? && project && issue.new_record?

      setting_issue_role_ids = Setting.plugin_redmine_auto_private_notes_and_issues['issue_role_ids'] || []
      membership = user.membership(project) rescue nil
      user_role_ids = membership ? membership.roles.map(&:id).map(&:to_s) : []

      match_found = (setting_issue_role_ids & user_role_ids).any?

      if match_found
        <<~HTML.html_safe
          <script>
            document.addEventListener('DOMContentLoaded', function () {
              var checkbox = document.getElementById('issue_is_private');
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
