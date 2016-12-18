Rails.application.routes.draw do  
  resources :issue_templates_notes
  resources :issue_templates_notes_settings
  get 'settings/plugin/redmine_issue_templates_notes', :to => 'issue_templates_notes_settings#back_partial_init'
  get 'issue_templates_notes/:id/edit', :to => 'issue_templates_notes#edit'
  post 'issue_templates_notes/preview', :to => 'issue_templates_notes#preview'
  get 'issue_templates_notes/:id/template_send', :to => 'issue_templates_notes#template_send'
  get 'settings/plugin/redmine_issue_templates_notes/users_authorization', :to => 'issue_templates_notes_settings#user_auth'
end