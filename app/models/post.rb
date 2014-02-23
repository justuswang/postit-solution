class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comment
end