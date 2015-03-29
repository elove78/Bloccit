class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator? 
        scope.all
      elsif user.owner_of?(post)
        scope.self
      else
        false
      end
    end
  end





end