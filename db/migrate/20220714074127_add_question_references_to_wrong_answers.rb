class AddQuestionReferencesToWrongAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :wrong_answers, :question, null: false, foreign_key: true
  end
end
