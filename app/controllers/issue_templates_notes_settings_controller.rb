class IssueTemplatesNotesSettingsController < ApplicationController
  before_filter :require_login
  def back_partial_init
    render :partial => "redmine_notes"
  end
end