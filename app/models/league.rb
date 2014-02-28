class League < ActiveRecord::Base

  belongs_to :user
  has_many :scoring_rules
  has_many :stat_cats, through: :scoring_rules

  def new
    
  end

end
