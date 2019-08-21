class CreateContractStatusesEnum < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE contract_status AS ENUM ('draft', 'signed');
    SQL
  end

  def down
    execute 'DROP type contract_status;'
  end
end
