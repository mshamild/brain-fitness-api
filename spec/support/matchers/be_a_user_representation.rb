RSpec::Matchers.define :be_a_user_representation do |user|
  match do |json|
    response_attributes = user.sliced_attributes %w(
      id
      created_at
      updated_at
      authentication_token
      email
      name
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
