class AddRightAnswerReferencesToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :right_answer, null: false, foreign_key: true
  end
end
