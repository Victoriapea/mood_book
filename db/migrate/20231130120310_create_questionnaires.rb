class CreateQuestionnaires < ActiveRecord::Migration[7.0]
  def change
    create_table :questionnaires do |t|
      t.string :question1
      t.string :question2
      t.string :question3
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
