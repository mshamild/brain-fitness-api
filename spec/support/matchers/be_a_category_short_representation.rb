RSpec::Matchers.define :be_a_category_short_representation do |category|
  match do |json|
    response_attributes = category.sliced_attributes %w(
      id
      created_at
      updated_at
      title
      color
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)

    expect(json['questions']).to be_blank
  end
end
