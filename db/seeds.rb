# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


cat = Category.find_or_create_by(name: 'Films années 2000')
r_a = RightAnswer.find_or_create_by(answer: 'American Psycho')
q = Question.find_or_create_by(question: 'Dans quel film de 2000 suit-on Patrick Bateman, qui travaille dans la bourse américaine?',
                               category_id: cat.id,
                               right_answer_id: r_a.id,
                               difficulty: 2)
WrongAnswer.find_or_create_by(answer: 'Fatal', question_id: q.id)
WrongAnswer.find_or_create_by(answer: 'La momie', question_id: q.id)
WrongAnswer.find_or_create_by(answer: 'Requiem for a dream', question_id: q.id)
puts q.errors.full_messages if q.errors
puts 'DB seeded'
