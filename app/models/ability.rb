class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # can :manage, User, id: user.id     before admin was created
    if user.admin?
      can :manage, :all
    else
      can :manage, User, id: user.id
      cannot :destroy, :all

    end
  end
end
