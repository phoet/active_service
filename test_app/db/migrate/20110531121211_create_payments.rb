class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.float :amount
      t.string :provider
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
