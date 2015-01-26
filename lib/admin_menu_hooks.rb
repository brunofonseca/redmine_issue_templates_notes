class AdminMenuHooks < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context = {})
    stylesheet_link_tag('redmine_issue_templates_notes.css', :plugin => 'redmine_issue_templates_notes')
  end
end 