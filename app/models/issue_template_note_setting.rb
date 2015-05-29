class IssueTemplateNoteSetting < ActiveRecord::Base

  belongs_to :author
  has_many :users

  validates :user_auth, :presence => true, :if => :user_auth?

  serialize :user_auth, Array


end
