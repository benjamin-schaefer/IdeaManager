class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :picture, PictureUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, 
         #authentication_keys: [:name]
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }

  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || name || email
  end

  def admin?
     name == "Admin" && id == 15
     #passwort: werbeboten
     #email: admin@admin.de
  end

#necessary for user login by email OR name
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  picture                :string(255)
#  locked                 :boolean
#
