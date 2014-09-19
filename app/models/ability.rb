class Ability
  include CanCan::Ability

  def initialize(user)
    default
    return unless user #end, falls kein user vorhanden

    signed_user(user)    
    admin if user.admin?
    locked_user(user) if user.locked
  end

  #geloggter Admin
  def admin
    can :manage, :all
  end

  #geloggte User, nicht admins
  def signed_user(user)
    #can :create, [Idea, Comment]
    can [:create, :update, :delete], [Idea, Comment], user_id: user.id
    can [:index, :show], User
    can :update, User, id: user.id
  end

  def locked_user(user)
    #can :show, User, id: user.id
    cannot [:index, :show], User
    can :show, User, id: user.id
    cannot [:create, :update, :delete], Idea
    cannot [:create, :update, :delete], Comment
  end

  #alle user, auch nicht geloggte
  def default
    can [:index, :show], [Idea, Comment]
    can :create, User
  end
end