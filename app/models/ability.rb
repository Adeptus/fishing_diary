class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :update, Place do |object|
        object.user_id == user.id
      end
      can :destroy, Place do |object|
        object.user_id == user.id
      end
    end
  end
end
