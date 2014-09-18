class Ability
  include CanCan::Ability

  def initialize(user)
    default

    return unless user #end, falls kein user vorhanden

    logged_user(user)    
    
    admin if user.admin?
  end

  #geloggter Admin
  def admin
    can :manage, :all
  end

  #geloggte User, nicht admins
  def logged_user(user)
    can :create, [Idea, Comment]
    can [:update, :delete, :benjamin], [Idea, Comment], user_id: user.id
  end

  #alle user, auch nicht geloggte
  def default
    #cannot
    can :read, :all
    cannot :read, User
    can :create, User
  end
end