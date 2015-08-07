[
  { file: 'js_questions.json', title: 'JavaScript', color: '#0000ff' },
  { file: 'ruby_questions.json', title: 'Ruby', color: '#ff0000' }
].each do |attributes|
  category = Category.find_or_create_by! attributes.slice(:title, :color)

  questions_attributes =
    JSON.parse \
    IO.read \
    Rails.root.join('db', 'seeds', 'data', attributes[:file])

  questions_attributes.each do |attributes|
    question = Question.find_or_create_by!(text: attributes['question'], category: category)

    attributes['answers'].each do |attributes|
      AnswerVariant.find_or_create_by! attributes.merge(question: question)
    end
  end
end
