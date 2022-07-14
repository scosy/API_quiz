class CreateRightAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :right_answers do |t|
      t.string :answer, unique: true, null: false

      t.timestamps
    end
  end
end
