class Expected_Draft_Position < ActiveRecord::Base

  has_many :scoring_projections
  has_many :leagues, through: :scoring_projections

end


