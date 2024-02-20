module IssueTemplatesNotesHelper

  def self.authorized_user
    @issue_templates_notes_setting = IssueTemplateNoteSetting.find("1")
    saved = @issue_templates_notes_setting[:user_auth]
    if (saved.include?("#{User.current.id}") || User.current.admin?)
      return true
    end
    return false
  end

end
