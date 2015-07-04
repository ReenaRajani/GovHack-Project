class CreatePropertyPrices < ActiveRecord::Migration
  def change
    create_table :property_prices do |t|
      t.date :date
      t.string :region
      t.integer :median

      t.timestamps null: false
    end
  end
end
