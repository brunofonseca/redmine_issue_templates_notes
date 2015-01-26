class IssueTemplatesNote < ActiveRecord::Base
  include Redmine::SafeAttributes
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :tracker, :class_name => 'Tracker', :foreign_key => 'tracker_id'
  alias_attribute :name_template, :template_name
  validates_presence_of :template_name
  validates_presence_of :tracker
  validates_presence_of :description
  validates_uniqueness_of :template_name
  safe_attributes 'template_name', 'description', 'tracker_id', 'enabled'
end
