class User < ActiveRecord::Base
  has_many :ideas, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  has_secure_password

  enum role: %w(default admin)

  def to_param
    username
  end

  def admin?
    role == "admin"
  end

end