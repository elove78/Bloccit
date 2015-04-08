class SummaryPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
  
  def show?
    true
  end

end