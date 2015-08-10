class GameCreator::GameFinder
  include Interactor

  def call
    context[:game] = find_game_with_one_user
  end

  private

  def find_game_with_one_user
    Game.find_by(users_count: 1)
  end
end
