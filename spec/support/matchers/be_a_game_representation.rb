RSpec::Matchers.define :be_a_game_representation do |game|
  match do |json|
    response_attributes = game.sliced_attributes %w(
      id
      created_at
      updated_at
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
    expect(json['rounds'].count).to eq 6

    game.rounds.zip(json['rounds']).each do |round, round_json|
      expect(round_json).to be_a_round_representation(round)
    end
  end
end
