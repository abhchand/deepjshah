class CreateWitnessesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :witnesses do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.datetime :witnessed_at, null: false
    end
  end
end
