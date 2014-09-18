class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  validates :user, presence:true
  validates :body, presence:true

  def user_name
    user.name
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  idea_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
