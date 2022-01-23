class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    #Type and attributes. T is an attribute passed to block. T = table
    create_table :users do |t|
      t.string :name
      t.string :email
      #Tell db that it should not be false
      t.timestamps null: false
    end
  end
end
