class Player < ActiveRecord::Base

  has_many :predraft_rankings
  has_many :leagues, through: :predraft_rankings

end
