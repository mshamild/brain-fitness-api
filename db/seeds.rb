[
  { file: 'ruby_questions.json', title: 'Ruby', color: '#ff0000' },
  { file: 'html_questions.json', title: 'HTML', color: '#00ff00' },
  { file: 'js_questions.json', title: 'JavaScript', color: '#0000ff' }
].each do |attributes|
  category = Category.find_or_create_by! attributes.slice(:title, :color)

  questions_hashes =
    JSON.parse \
    IO.read \
    Rails.root.join('db', 'seeds', 'data', attributes[:file])

  questions_hashes.each do |attributes|
    Question.find_or_create_by(text: attributes['question']) do |question|
      question.category = category
      question.answer_variants = attributes['answers'].map do |attributes|
        AnswerVariant.find_or_initialize_by(attributes)
      end
    end
  end
end
