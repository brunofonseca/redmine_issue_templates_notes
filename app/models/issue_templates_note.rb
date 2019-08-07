class IssueTemplatesNote < ActiveRecord::Base

  include Redmine::SafeAttributes

  belongs_to :author,  :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :tracker, :class_name => 'Tracker', :foreign_key => 'tracker_id'

  alias_attribute :name_template, :template_name

  validates_presence_of :template_name
  #validates_presence_of :tracker
  validates_presence_of :description

  validates_uniqueness_of :template_name, scope: :tracker_id

  #before_save :validade_if_exist, :only => [:create,:update,:new]

  safe_attributes 'template_name', 'description', 'tracker_id', 'enabled'

  #def validade_if_exist
  #  if IssueTemplatesNote.exists?(["template_name = ? AND tracker_id = ? ",template_name, tracker_id])
  #    return false
  #  end
  #end

end
