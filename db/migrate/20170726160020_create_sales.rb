class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.decimal :amount
      t.string :zip
      t.string :state
      t.string :address
      t.string :note
      t.belongs_to :service, foreign_key: true
      t.belongs_to :equipment, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
