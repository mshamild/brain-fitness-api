class V1::RoundsController < V1::BaseController
  def create
    respond_with round
  end

  private

  def round
    RoundCreator.call(game: game, user: current_user).round
  end

  def game
    Game.find_by(id: params[:game_id])
  end
end
