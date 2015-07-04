class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :gender
      t.string :state
      t.integer :age_min
      t.integer :age_max
      t.integer :average

      t.timestamps null: false
    end
  end
end
