class FollowRequestPolicy < ApplicationPolicy

  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user == @follow_request.recipient || user == @follow_request.sender  
  end

  def update?
    true
  end

  def destroy?
    user == @follow_request.recipient || user == @follow_request.sender
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
