RSpec::Matchers.define :be_a_answer_representation do |answer|
  match do |json|
    response_attributes = answer.sliced_attributes %w(
      id
      created_at
      updated_at
      user_id
      round_question_id
      answer_variant_id
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
