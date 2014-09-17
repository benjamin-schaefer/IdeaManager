class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      admin
    elsif user
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
    can :create, [Idea, Comment]
    can [:update, :destroy], [Idea, Comment], user_id: user.id
  end

  #alle user, auch nicht geloggte
  def default
    can :read, :all, except: User
    can :create, User
  end
end