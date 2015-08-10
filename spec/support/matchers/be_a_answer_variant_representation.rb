RSpec::Matchers.define :be_a_answer_variant_representation do |answer_variant|
  match do |json|
    response_attributes = answer_variant.sliced_attributes %w(
      id
      created_at
      updated_at
      value
      text
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
