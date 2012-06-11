class Match < ActiveRecord::Base
  has_many :match_guesses
  belongs_to :home, :class_name => "Country"
  belongs_to :away, :class_name => "Country"
end
