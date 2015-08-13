class RoundUpdater
  include Interactor

  def call
    update_round!
  end

  private

  delegate :round, :user, :attributes, to: :context

  def prepaired_attributes
    attributes
      .fetch(:round_categories_attributes)
      .first
      .fetch(:round_questions_attributes).each do |question_attributes|
        question_attributes.fetch(:answers_attributes).each do |answer_attribtues|
          answer_attribtues[:user] = user
        end
      end

    attributes
  end

  def update_round!
    round.update_attributes!(prepaired_attributes)
  end
end
