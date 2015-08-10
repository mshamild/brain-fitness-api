RSpec::Matchers.define :be_a_question_representation do |question|
  match do |json|
    response_attributes = question.sliced_attributes %w(
      id
      created_at
      updated_at
      text
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)

    question.answer_variants.zip(json['answer_variants']).each do |answer_variant, answer_json|
      expect(answer_json).to be_a_answer_variant_representation(answer_variant)
    end
  end
end
