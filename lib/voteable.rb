# Using Concerns
module Voteable
  extend ActiveSupport::Concern
  included do
    has_many :votes, as: :voteable
  end

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

# Using normal metaprogramming
=begin
module Voteable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      my_class_method
    end
  end
  module InstanceMethods
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

  module ClasMethods
    def my_class_method
      has_many :votes, as: :voteable
    end
  end
end
=end