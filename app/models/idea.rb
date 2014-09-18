class Idea < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  #erst alle Comments löschen, um nicht zugewiesene comments zu verhindern
  has_many :comments, dependent: :destroy
  validates :name, presence:true
  validates :description, presence:true
  belongs_to :user
end

# == Schema Information
#
# Table name: ideas
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  picture     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#
