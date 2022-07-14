class CreateWrongAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :wrong_answers do |t|
      t.string :answer

      t.timestamps
    end
  end
end
