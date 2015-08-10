class GameCreator
  include Interactor

  def call
    context[:game] = create_game!
  end

  private

  def create_game!
    GameBuilder.call.game.tap(&:save!)
  end
end
