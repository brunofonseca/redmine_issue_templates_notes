class IssueTemplatesNotesSettingsController < ApplicationController

  before_action :require_login

  def back_partial_init
    render :partial => "redmine_notes"
  end

  def new
    @issue_templates_notes_setting = IssueTemplateNoteSetting.new
  end

  def user_auth
    @issue_templates_notes_setting = IssueTemplateNoteSetting.find("1")
    if request.post?
      if params[:activated] != nil
        saved = @issue_templates_notes_setting[:user_auth]
        activated_ids = params[:activated]
        delete_ids = params[:seen] - activated_ids
          saved += activated_ids - @issue_templates_notes_setting[:user_auth]
          saved -= delete_ids
            @issue_templates_notes_setting.update_attributes(:user_auth => saved)
            @issue_templates_notes_setting.save!
            flash[:notice] = l(:notice_successful_update)
            redirect_to :controller => 'issue_templates_notes_settings', :action => "back_partial_init"
        end
      if params[:activated].nil?
        @issue_templates_notes_setting.update_attributes(:user_auth => ['0'])
        @issue_templates_notes_setting.save!
        flash[:notice] = l(:notice_successful_update)
        redirect_to :controller => 'issue_templates_notes_settings', :action => "back_partial_init"
      end
    end
  end
end
