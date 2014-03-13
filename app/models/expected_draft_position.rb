class ExpectedDraftPosition < ActiveRecord::Base

  has_many :projections
  has_many :leagues, through: :scoring_projections

end


