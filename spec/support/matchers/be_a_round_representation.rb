RSpec::Matchers.define :be_a_round_representation do |round|
  match do |json|
    response_attributes = round.sliced_attributes %w(
      id
      created_at
      updated_at
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)

    expect(json['round_categories'].count).to eq 3

    round.round_categories.zip(json['round_categories']).each do |round_category, round_category_json|
      expect(round_category_json).to be_a_round_category_representation(round_category)
    end
  end
end
