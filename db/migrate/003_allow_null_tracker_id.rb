class AllowNullTrackerId < ActiveRecord::Migration

  def self.up
    change_column :issue_templates_notes, :tracker_id, :integer, null: true
  end

  def self.down
    change_column :issue_templates_notes, :tracker_id, :integer, null: false
  end

end
