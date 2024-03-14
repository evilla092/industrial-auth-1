class CommentPolicy < ApplicationPolicy

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    user == comment.author
  end

  def destroy?
    user == comment.author || user == comment.owner
  end

  # def show?
  #   user == comment.author || user == comment.owner || !comment.owner.private? || comment.owner.followers.include?(user)
  # end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    user == comment.author
  end


end
