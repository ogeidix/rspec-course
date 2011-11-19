class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,     :default => ''
      t.string :surname,  :default => ''
      t.string :email

      t.timestamps
    end
  end
end
