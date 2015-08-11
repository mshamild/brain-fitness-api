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
    Game.find_by(users_count: 1)
  end

  def create_game!
    Game.create
  end
end
