class AdminMenuHooks < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context = {})
    o = stylesheet_link_tag('redmine_issue_templates_notes.css', :plugin => 'redmine_issue_templates_notes')
    o << javascript_include_tag('redmine_issue_templates_notes', :plugin => 'redmine_issue_templates_notes')
    return o
  end
end 
