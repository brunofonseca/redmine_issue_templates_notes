class CreateIssueTemplatesNotes < ActiveRecord::Migration
  def change
    create_table :issue_templates_notes do |t|
      t.column :template_name,     :string,     :null => false
      t.column :tracker_id,        :integer, :null => false
      t.column :author_id,         :integer, :null => false
      t.column :description,       :text
      t.column :enabled,           :boolean
      t.column :created_on,        :timestamp
      t.column :updated_on,        :timestamp
    end
    add_index :issue_templates_notes, :author_id
    add_index :issue_templates_notes, :tracker_id
  end
  def self.down
    remove_index :issue_templates_notes, :author_id
    remove_index :issue_templates_notes, :tracker_id
    drop_table   :issue_templates_notes
  end
end
