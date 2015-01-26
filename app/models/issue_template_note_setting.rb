class IssueTemplateNoteSetting < ActiveRecord::Base
include Redmine::SafeAttribute
  belongs_to :author
end
