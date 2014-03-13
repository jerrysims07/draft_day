class PredraftRankingsController < ApplicationController

  def show 
    @league = League.find(params[:id])
    rbs=@league.players.where(:position => 'RB')
    @rbs=[]
    rbs.each do |rb|
      output={}
      output[:rb] = rb 
      output[:position_rank]=PredraftRanking.find_by(:player_id => rb.id)
      @rbs << output
    end

    qbs=@league.players.where(:position => 'QB')
    @qbs=[]
    qbs.each do |qb|
      output={}
      output[:qb] = qb 
      output[:position_rank]=PredraftRanking.find_by(:player_id => qb.id)
      @qbs << output
    end

    wrs=@league.players.where(:position => 'WR')
    @wrs=[]
    wrs.each do |wr|
      output={}
      output[:wr] = wr 
      output[:position_rank]=PredraftRanking.find_by(:player_id => wr.id)
      @wrs << output
    end

    tes=@league.players.where(:position => 'TE')
    @tes=[]
    tes.each do |te|
      output={}
      output[:te] = te 
      output[:position_rank]=PredraftRanking.find_by(:player_id => te.id)
      @tes << output
    end

    ks=@league.players.where(:position => 'K')
    @ks=[]
    ks.each do |k|
      output={}
      output[:k] = k 
      output[:position_rank]=PredraftRanking.find_by(:player_id => k.id)
      @ks << output
    end

    defns=@league.players.where(:position => 'DEF')
    @defns=[]
    defns.each do |defn|
      output={}
      output[:defn] = defn 
      output[:position_rank]=PredraftRanking.find_by(:player_id => defn.id)
      @defns << output
    end


    # @rbs.each do |rb|
    #   rb[position_rank]=PredraftRanking.find(player_id: rb.id)
    # end
  end

end