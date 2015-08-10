class GameCreator::GameBuilder
  include Interactor

  def call
    context[:game] = build_game
  end

  private

  def build_game
    Game.new(rounds: new_rounds)
  end

  def new_rounds
    RoundsBuilder.call.rounds
  end
end
