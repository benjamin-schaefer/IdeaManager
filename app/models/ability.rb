class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      admin
    elsif user != nil
      logged_user(user)
    end
    default
  end

  #geloggter Admin
  def admin
    can :manage, :all
  end

  #geloggte User, nicht admins
  def logged_user(user)
    can [:create, :update, :destroy], [Idea, Comment], user_id: user.id
  end

  #alle user, auch nicht geloggte
  def default
    can :read, :all, except: User
  end
end