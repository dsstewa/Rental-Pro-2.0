class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :password_digest
      t.string  :email
      t.string  :phone_number
      t.boolean :admin, default: false
      t.timestamps
      t.belongs_to  :company, foreign_key: true
    end
  end
end
