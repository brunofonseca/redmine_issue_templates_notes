class TemplateNoteSettings
  def authorized_users
    @issue_templates_notes_setting = IssueTemplateNoteSetting.find("1")
    saved = @issue_templates_notes_setting[:user_auth]
    return saved
  end
end