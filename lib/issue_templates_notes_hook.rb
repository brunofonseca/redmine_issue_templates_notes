class IssueTemplatesNotesHook < Redmine::Hook::ViewListener
  render_on :view_issues_edit_notes_bottom, :partial => 'issue_templates_notes/issue_select_options'

#Include a icon
 
  include ApplicationHelper
  
  def view_layouts_base_html_head(context = {})
    o = stylesheet_link_tag('redmine_issue_templates_notes', :plugin => 'redmine_issue_templates_notes')
#    o << javascript_include_tag('issue_templates_notes', :plugin => 'redmine_issue_templates_notes')
    return o
  end
end
