class IssueTemplatesNotesController < ApplicationController
  #layout 'base'
  include IssueTemplatesNotesHelper
  helper :issues
  include IssuesHelper
  before_filter :find_user
  before_filter :authorize => :preview
  before_filter :require_login, :require_access_to
  def index
    @issue_templates_notes = IssueTemplatesNote.order(:tracker_id)
    @user_logged = User.current
    respond_to do |format|
      format.html
      format.json { render json: @issue_templates_notes }
    end
  end

  def show
    @issue_templates_note = IssueTemplatesNote.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @issue_templates_note }
    end
  end

  def new
    @issue_templates_note = IssueTemplatesNote.new(:author => @user)
    if request.post?
      @issue_templates_note.safe_attributes = params[:issue_templates_note]
      if @issue_templates_note.save
        flash[:notice] = l(:notice_successful_create)
        redirect_to redirect_to issue_templates_notes_url
      end
    end
  end

  def edit
    @issue_templates_note = IssueTemplatesNote.find(params[:id])
  end

  def create
    @issue_templates_note = IssueTemplatesNote.new(issue_templates_note_params)
    respond_to do |format|
      if @issue_templates_note.save
        format.html {
          flash[:notice] = l(:msg_notice_sucess_create)
          redirect_to :controller => "issue_templates_notes",:action => "index"
        }
      else
        #flash[:error] = l(:msg_template_exists)
        format.html { render action: "new" }
        format.json { render json: @issue_templates_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @issue_templates_note = IssueTemplatesNote.find(params[:id])
    respond_to do |format|
      if @issue_templates_note.update_attributes(issue_templates_note_params)
        format.html {
          flash[:notice] = l(:msg_notice_sucess_updated)
          redirect_to :contoller => "issues_templates_notes",:action => "index"
        }
      else
        flash[:error] = l(:msg_notice_sucess_updated)
        format.html { render action: "edit" }
        format.json { render json: @issue_templates_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue_template_note = IssueTemplatesNote.find(params[:id])
    if @issue_template_note.destroy
      flash[:notice] = l(:notice_successful_delete)
      redirect_to issue_templates_notes_url
    else
      flash[:error] = l(:notice_error_to_delete)
      redirect_to issue_templates_notes_url
    end
  end

  def preview
    @text = params[:issue_templates_note][:description]
    render :partial => 'common/preview'
  end

  def template_send
    @template_note = IssueTemplatesNote.where('enabled = ?', 1)
    render :text => @template_note.to_json
  end

  def require_access_to
    @issue_templates_notes_setting = IssueTemplateNoteSetting.find("1")
    saved = @issue_templates_notes_setting[:user_auth]
    if(saved.include?("#{User.current.id}") || User.current.admin?)
      return true
    end
      render_403
  end
  
  private

  def issue_templates_note_params
    params.require(:issue_templates_note).permit(:template_name,:tracker_id,:author_id,:description,:enabled)
  end

  #find the instance of user current
  def find_user
    @user = User.current
  end
end