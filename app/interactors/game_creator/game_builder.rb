class GameCreator::GameBuilder
  include Interactor

  def call
    context[:game] = build_game
  end

  private

  def build_game
    Game.new
  end
end
