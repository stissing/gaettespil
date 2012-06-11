class MatchGuess < ActiveRecord::Base
  belongs_to :coupon
  belongs_to :match

  validates :home_score, :away_score, :presence => true
  validates :home_score, :away_score, :numericality => { :only_integer => true, :greater_than_or_equal => 0 }
  
  #TODO validates :match, :coupon, :presence => true
end
