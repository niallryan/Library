class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_name

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/writing-tests/
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                             with: /^[a-zA-Z0-9_-]+$/,
                             message: "Must be formatted correctly."
                           }

  has_many :updates
  has_many :books
  has_many :user_friendships
  has_many :reviews
  has_many :book_lists

  # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/creating-friendships/
  has_many :friends, through: :user_friendships

  # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/building-the-friendship-ui/creating-the-friendship-form
  def to_param
    profile_name
  end

end
