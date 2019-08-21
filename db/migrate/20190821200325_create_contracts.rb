class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.column :status, :contract_status, null: false, index: true
      t.string :name, null: false, index: { unique: true }, limit: 255
      t.date :start_date, null: false
      t.decimal :avg_monthly_price, null: false, default: 0, precision: 8,
                scale: 2
      t.timestamps
    end
  end
end
