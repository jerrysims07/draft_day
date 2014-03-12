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

  def create_scoring_projections(league)
    puts "here is the new scoring projection:  " +league.passTDs.to_s
  end

  def create_predraft_rankings(league)
    rbs = Player.where(:position => "RB").all
    rbs.each do |rb| 
      pdr = Predraft_Ranking.new(player_id: rb.id, league_id: league.id, position_rank: 1)
      pdr.save
    end
  end

end
