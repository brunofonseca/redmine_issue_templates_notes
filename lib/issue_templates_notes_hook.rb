class IssueTemplatesNotesHook < Redmine::Hook::ViewListener
  render_on :view_issues_edit_notes_bottom, :partial => 'issue_templates_notes/issue_select_options'
end
