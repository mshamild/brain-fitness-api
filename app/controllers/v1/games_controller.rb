class V1::GamesController < V1::BaseController
  def create
    respond_with game
  end

  private

  def game
    GameCreator.call(user: current_user).game
  end
end
