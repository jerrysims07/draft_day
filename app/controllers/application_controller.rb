class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

    def after_sign_in_path_for(user)
        user_path(user)
    end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  helper_method :create_scoring_projections
  helper_method :create_predraft_rankings
  helper_method :point_allowed

  def create_scoring_projections(league)
    builderObject = { 2010 =>  {'RB' => [],
                                'QB' => [],
                                'WR' => [],
                                'TE' => [],
                                'K'  => [],
                                'DEF'=> []},
                      2011 =>  {'RB' => [],
                                'QB' => [],
                                'WR' => [],
                                'TE' => [],
                                'K'  => [],
                                'DEF'=> []},
                      2012 =>  {'RB' => [],
                                'QB' => [],
                                'WR' => [],
                                'TE' => [],
                                'K'  => [],
                                'DEF'=> []},
                      2013 =>  {'RB' => [],
                                'QB' => [],
                                'WR' => [],
                                'TE' => [],
                                'K'  => [],
                                'DEF'=> []}}
                      
    l = League.find(league.id)
    hps= HistoryStat.all
    hps.each do |hp| 
      score = 0
      if l.passTDs && hp.passTDs 
        score+=(l.passTDs * hp.passTDs)
      end
      if l.passYds && hp.passYds
        score+=(hp.passYds/l.passYds)
      end
      if l.intThrown && hp.intThrown
        score+=(l.intThrown  * hp.intThrown)
      end
      if l.rushTDs && hp.rushTDs
        score+=(l.rushTDs    * hp.rushTDs  )
      end
      if l.rushYds && hp.rushYds
        score+=(hp.rushYds/l.rushYds  )
      end
      if l.recTDs && hp.recTDs
        score+=(l.recTDs     * hp.recTDs   )
      end
      if l.recYds && hp.recYds
        score+=(hp.recYds/l.recYds   )
      end   
      if l.twoPt && hp.twoPt
        score+=(l.twoPt      * hp.twoPt    )                
      end
      if l.retTDs && hp.retTDs
        score+=(l.retTDs * hp.retTDs)
      end   
      if l.fumbLost && hp.fumbLost
        score+=(l.fumbLost   * hp.fumbLost )
      end
      if hp.fantasyPts
        score+= hp.fantasyPts
      end
      if hp.position == "DEF"
        score+= points_allowed(l,hp)
      end
      if l.defTD && hp.defTD
        score+= (l.defTD * hp.defTD)
      end
      if l.defINT && hp.defINT
        score+= (l.defINT * hp.defINT)
      end
      if l.defFumbRec && hp.defFumbRec
        score+= (l.defFumbRec * hp.defFumbRec)
      end
      if l.defBlock && hp.defBlock
        score+= (l.defBlock * hp.defBlock)
      end
      if l.defSafety && hp.defSafety
        score+= (l.defSafety * hp.defSafety)
      end 
      if l.defSack && hp.defSack
        score+= (l.defSack * hp.defSack)
      end

      builderObject[hp.year.to_i][hp.position]<< score

    end
    #sort builderObject
    builderObject.each do |year, positions|
      positions.each do |pos, score|
        score.sort!.reverse!
      end
    end

    populateObject={:QB => [], :RB => [], :WR => [], :TE => [], :K => [], :DEF => []}
    26.times do |i|
      populateObject[:QB]<< ( (builderObject[2013]['QB'][i] * 0.4) +
                              (builderObject[2012]['QB'][i] * 0.3) +
                              (builderObject[2011]['QB'][i] * 0.2) +
                              (builderObject[2010]['QB'][i] * 0.1) )
    end
    64.times do |i|
      populateObject[:RB]<< ( (builderObject[2013]['RB'][i] * 0.4) +
                              (builderObject[2012]['RB'][i] * 0.3) +
                              (builderObject[2011]['RB'][i] * 0.2) +
                              (builderObject[2010]['RB'][i] * 0.1) )
    end
    66.times do |i|
      populateObject[:WR]<< ( (builderObject[2013]['WR'][i] * 0.4) +
                              (builderObject[2012]['WR'][i] * 0.3) +
                              (builderObject[2011]['WR'][i] * 0.2) +
                              (builderObject[2010]['WR'][i] * 0.1) )
    end
    22.times do |i|
      populateObject[:TE]<< ( (builderObject[2013]['TE'][i] * 0.4) +
                              (builderObject[2012]['TE'][i] * 0.3) +
                              (builderObject[2011]['TE'][i] * 0.2) +
                              (builderObject[2010]['TE'][i] * 0.1) )
    end
    14.times do |i|
      populateObject[:K]<< ( (builderObject[2013]['K'][i] * 0.4) +
                              (builderObject[2012]['K'][i] * 0.3) +
                              (builderObject[2011]['K'][i] * 0.2) +
                              (builderObject[2010]['K'][i] * 0.1) )
    end
    16.times do |i|
      populateObject[:DEF]<< ( (builderObject[2013]['DEF'][i] * 0.4) +
                              (builderObject[2012]['DEF'][i] * 0.3) +
                              (builderObject[2011]['DEF'][i] * 0.2) +
                              (builderObject[2010]['DEF'][i] * 0.1) )
    end
    populateObject.each do |key, ary|
      ary.each.with_index(1) do |rank, i|
        edp = ExpectedDraftPosition.find_by(:position_rank => (key.to_s+i.to_s))
        puts "compared \'"+(key.to_s+i.to_s)+"\'"
        projection = Projection.new(league_id: l.id, expected_draft_position_id: edp.id, total_pts: rank)
        projection.save
      end
    end
  end
 

  def create_predraft_rankings(league)
    ['QB', 'RB', 'TE', 'WR', 'K', 'DEF'].each do |pos|
      players_at_position = Player.where(:position => pos).all
      players_at_position.each.with_index(1) do |rb, i| 
        pdr = PredraftRanking.new(player_id: rb.id, league_id: league.id, position_rank: i, position: pos, concat: (pos+i.to_s))
        pdr.save
      end
    end
  end

  def points_allowed(l, hp)
    avgPts=hp.avgPtsAllowed/16
    if avgPts<7
      return (l.ptsAllowed1to6 * 16).to_i
    elsif avgPts<14
      return (l.ptsAllowed7to13 * 16).to_i
    elsif avgPts<17
      return (l.ptsAllowed14to17.to_i * 16).to_i
    elsif avgPts<28
      return (l.ptsAllowed18to27 * 16).to_i
    elsif avgPts<35
      return (l.ptsAllowed28to34 * 16).to_i
    elsif avgPts<46
      return (l.ptsAllowed35to45 * 16).to_i
    else
      return (l.ptsAllowed46plus * 16).to_i
    end
  end
end
