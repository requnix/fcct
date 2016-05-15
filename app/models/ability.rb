class Ability
  include CanCan::Ability

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  def initialize(member)
    member ||= Member.new # guest user (not logged in)

    can :manage, :all if member.holds_position? 'Webmaster'
    can :update, Member if member.holds_position? 'Membership Officer'

    committee_permissions if member.committee?
    guest_permissions
  end

  def committee_permissions
    can :read, ActiveAdmin::Page, name: 'Dashboard'
  end

  def guest_permissions
    can :read, Member
    can :read, Event
  end
end
