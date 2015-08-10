class GameCreator
  include Interactor

  def call
    context[:game] = find_or_create_game!.tap do |game|
      game.users << context[:user]
    end
  end

  private

  def find_or_create_game!
    find_game || create_game!
  end

  def find_game
    GameFinder.call.game
  end

  def create_game!
    GameBuilder.call.game.tap(&:save!)
  end
end
