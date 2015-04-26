class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, :description, :user_id, :category_id, presence: true

  def owned_by?(current_user_id)
    user_id == current_user_id
  end

end