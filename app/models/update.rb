class Update < ActiveRecord::Base
  attr_accessible :content, :user_id

  opinio_subjectum

  belongs_to :user

  validates :user_id, presence: true

  validates :content, presence: true

end
