class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :message
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
