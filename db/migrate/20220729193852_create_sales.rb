class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :name
      t.string :description
      t.date :starts_on
      t.date :ends_on
      t.string :status
      t.integer :percent_off

      t.timestamps
    end
  end
end
