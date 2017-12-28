Rails.application.routes.draw do

  resources :issue_templates_notes
  resources :issue_templates_notes_settings

  match 'settings/plugin/redmine_issue_templates_notes',
        :controller  => 'issue_templates_notes_settings',
        :action => 'back_partial_init',
        :via => :get

  match 'issue_templates_notes/:id/edit',
        :controller => 'issue_templates_notes',
        :action => :edit,
        :via => :get

  match 'issue_templates_notes/preview',
        :controller => 'issue_templates_notes',
        :action => 'preview',
        :via => [:get,:post]

  match 'issue_templates_notes/:id/template_send',
        :controller => 'issue_templates_notes',
        :action => 'template_send',
        :via => [:get,:post]

  match 'settings/plugin/redmine_issue_templates_notes/users_authorization',
        :controller => 'issue_templates_notes_settings',
        :action => 'user_auth',
        :via => [:get,:post]

end