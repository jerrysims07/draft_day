class StatCat < ActiveRecord::Base

  has_many :scoring_rules
  has_many :leagues, through: :scoring_rules
  
end
