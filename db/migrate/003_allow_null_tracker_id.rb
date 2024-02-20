class AllowNullTrackerId < ActiveRecord::Migration[4.2]

  def self.up
    change_column :issue_templates_notes, :tracker_id, :integer, null: true
  end

  def self.down
    change_column :issue_templates_notes, :tracker_id, :integer, null: false
  end

end
