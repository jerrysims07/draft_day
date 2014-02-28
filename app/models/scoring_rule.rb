class ScoringRule < ActiveRecord::Base

  belongs_to :league
  belongs_to :stat_cat


  def new(multiplier)
    @multiplier = multiplier
  end

end
