class Comment < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :post
  validates :body, presence: true
  has_many :votes, as: :voteable

  def total_votes
  	self.up_votes - self.down_votes 
  end

  def up_votes
  	self.votes.where(vote: true).size
  end

  def down_votes
  	self.votes.where(vote: false).size
  end
end