class GameCreator
  include Interactor

  def call
    context[:game] = create_game!
  end

  private

  delegate :new, to: :Game, prefix: true

  def create_game!
    build_game.tap(&:save!)
  end

  def build_game
    game_new do |game|
      Game::ROUNDS.times do
        game.rounds << RoundBuilder.call.round
      end
    end
  end
end
