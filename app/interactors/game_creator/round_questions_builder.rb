class GameCreator::RoundQuestionBuilder
  include Interactor

  def call
    build_round_questions
  end

  private

  delegate :category, to: :context

  def build_round_questions
    random_questions.map do |question|
      RoundQuestion.new(question: question)
    end
  end

  def random_questions
    category
      .questions
      .random(RoundCategory::QUESTIONS_COUNT)
  end
end
