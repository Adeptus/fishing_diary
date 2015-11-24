class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, Place do |object|
        !object.private? || object.user_id == user.id
      end
      can :update, Place do |object|
        object.user_id == user.id
      end
    end
  end
end
