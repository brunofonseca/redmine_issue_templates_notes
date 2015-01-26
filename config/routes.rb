Rails.application.routes.draw do  
  resources :issue_templates_notes
  resources :issue_templates_notes_settings
  match 'settings/plugin/redmine_issue_templates_notes', :to => 'issue_templates_notes_settings#back_partial_init'
  match "issue_templates_notes/:id/edit", :to => "issue_templates_notes#edit"
  match 'issue_templates_notes/preview', :to => 'issue_templates_notes#preview', :via => [:get, :post]
  match 'issue_templates_notes/:id/template_send', :to => 'issue_templates_notes#template_send', :via => [:get, :post]
end