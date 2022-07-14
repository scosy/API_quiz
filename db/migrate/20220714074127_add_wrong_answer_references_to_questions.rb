class AddWrongAnswerReferencesToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :wrong_answer, null: false, foreign_key: true
  end
end
