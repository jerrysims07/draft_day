class League < ActiveRecord::Base

  belongs_to :user

  has_many :predraft_rankings
  has_many :players, through: :predraft_rankings

  has_many :scoring_projections
  has_many :expected_draft_positions, through: :scoring_projections


end



