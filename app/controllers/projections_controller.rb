class ProjectionsController < ApplicationController

  def show
    @league = League.find(params[:id])
    edp = ExpectedDraftPosition.all
    @edp=[]
    edp.each do |slot|
      output={}
      output[:edp]=slot
      pdr=PredraftRanking.find_by(:concat => slot.position_rank)
      output[:player]=Player.find(pdr.player_id)
      output[:projection]=Projection.find_by(:league_id => @league.id, :expected_draft_position_id => slot.projection)
      @edp << output
    end
    puts @edp
  end

end