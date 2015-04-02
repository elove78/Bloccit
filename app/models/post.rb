class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

 default_scope { order('title ASC') }

end
