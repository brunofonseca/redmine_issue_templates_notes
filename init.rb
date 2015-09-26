require 'redmine'
require 'admin_menu_hooks'
require 'issue_templates_notes_hook'
require 'template_notes_permissions'

Redmine::Plugin.register :redmine_issue_templates_notes do
  name 'Redmine Issue Templates Notes plugin'
  author 'Bruno Fonseca'
  description 'Plugin para template de notas'
  author_url 'https://github.com/brunofonseca'
  version '2.0.0'

  settings :default => {'empty' => true}, :partial => 'settings/redmine_notes'

  users_auth = TemplateNoteSettings.new

  menu :admin_menu, :redmine_issue_templates_notes, {:controller => 'issue_templates_notes_settings',:action => 'back_partial_init'}, :caption => :template_notes, :after => :settings #, :if => Proc.new{User.current.admin?}

  menu :top_menu, :redmine_issue_templates_notes, {
                    :controller => 'issue_templates_notes',
                    :action => 'index' },
       :last => true,
       :caption => :template_notes,
       :if => Proc.new {users_auth.authorized_users.include?("#{User.current.id}")}

  project_module :issue_templates_notes do
    permission :load_issue_templates_notes  , {:issue_templates_notes =>[:load]}
  end

end