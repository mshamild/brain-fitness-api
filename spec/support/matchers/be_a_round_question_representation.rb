RSpec::Matchers.define :be_a_round_question_representation do |round_question|
  match do |json|
    response_attributes = round_question.sliced_attributes %w(
      id
      created_at
      updated_at
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)

    expect(json['question']).to be_a_question_representation(round_question.question)

    round_question.answers.zip(json['answers']).each.map do |answer, answer_json|
      expect(answer_json).to be_a_answer_representation(answer)
    end
  end
end
