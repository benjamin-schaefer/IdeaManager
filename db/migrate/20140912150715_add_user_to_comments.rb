class AddUserToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true

    Comment.all.each do |comment|
    	comment.user = User.where(name: comment.user_name).first_or_create!
    	
    end

    remove_column :comments, :user_name
  end
end
