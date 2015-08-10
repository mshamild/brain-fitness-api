class GameCreator::RoundCategoriesBuilder
  include Interactor

  def call
    context[:round_categories] = build_round_categories
  end

  private

  def build_round_categories
    random_categories
      .map do |category|
        RoundCategory.new(
          category: category,
          round_questions: round_questions_for(category)
        )
      end
  end

  def random_categories
    Category.random(Round::CATEGORIES_COUNT)
  end

  def round_questions_for(category)
    RoundQuestionsBuilder.call(category: category)
  end
end
