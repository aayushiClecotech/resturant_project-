class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.restaurant_owner?
      can :read, :all
      can :manage, Restaurant, user_id: user.id
      
    else user.normal_user?
      can :read, Restaurant
    end
   end
end