class User < ActiveRecord::Base
	has_many :post
	has_many :comment
end