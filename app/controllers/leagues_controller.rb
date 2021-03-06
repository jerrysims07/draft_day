class LeaguesController < ApplicationController
    before_filter :authenticate_user!
  
  def new 
    @league = League.new
  end
    
  def create
    @league = current_user.leagues.new(league_params)
    if @league.save
      create_scoring_projections @league
      create_predraft_rankings @league
      redirect_to user_path current_user 
    end
  end

  def show
    @league = League.find(params[:id])
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    redirect_to league_path(@league)
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy
    redirect_to user_path(current_user)
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
