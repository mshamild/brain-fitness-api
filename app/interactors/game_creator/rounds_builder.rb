class GameCreator::RoundsBuilder
  include Interactor

  def call
    context[:rounds] = build_rounds
  end

  private

  def build_rounds
    Game::ROUNDS_COUNT.times.map do
      Round.new(round_categories: new_round_categories)
    end
  end

  def new_round_categories
    GameCreator::RoundCategoriesBuilder.call.round_categories
  end
end
