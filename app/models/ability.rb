class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest
    if user.administrator? == true
      can :manage, :all
    else
      can :read, :all
      can :create, Topic
      can :update, Topic do |topic|
        topic.try(:user) == user || user.administrator?(true)
      end
    end

  end

end
