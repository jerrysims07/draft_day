class LeaguesController < ApplicationController
  
  def new 
    @league = League.new
    # @league.build
  end
    
  def create
    @league = current_user.leagues.new(league_params)
    # @statCat = (standardScore => params[:ScoringRule][:passTDs], name => params[:ScoringRule])
    if @league.save
      redirect_to user_path current_user 

    # else
    #   render 'new'
    end
  end

  private
  def league_params
    params[:League].permit(
    :name,
    :passTDs,
    :passYds,
    :intThrown,
    :rushTDs,
    :rushYds,
    :recTDs,
    :recYds,
    :twoPt,
    :retTDs,
    :fumbLost,
    :FG50up,
    :FG40to49,
    :FG39down,
    :PAT,
    :FGmissed,
    :defTD,
    :defINT,
    :defFumbRec,
    :defBlock,
    :defSafety,
    :defSack,
    :ptsAllowed0,
    :ptsAllowed1to6,
    :ptsAllowed7to13,
    :ptsAllowed14to17,
    :ptsAllowed18to27,
    :ptsAllowed28to34,
    :ptsAllowed35to45,
    :ptsAllowed46plus)
  end

end
