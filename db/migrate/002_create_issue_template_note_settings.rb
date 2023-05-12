class CreateIssueTemplateNoteSettings < ActiveRecord::Migration[4.2]

  def self.up
    create_table :issue_template_note_settings do |t|
      t.column  :user_auth, :text
    end
    IssueTemplateNoteSetting.create(:user_auth => ['0'])
  end

  def self.down
    drop_table :issue_template_note_settings
  end

end
