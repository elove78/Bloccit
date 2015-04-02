class PostPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user && (user.role == 'admin' || user.role == 'moderator')
        scope.all
      else
        scope.where(user: true)
      end
    end
  end

  def index?
    @user && (user.role == 'admin' || user.role == 'moderator' || user.present?)
  end

  def show
    @post = Post.find(params[:id])
  end


end