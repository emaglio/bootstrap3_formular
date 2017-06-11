class InitializeDatabase < ActiveRecord::Migration[5.1]
  def change

    create_table :users do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.datetime :dob
      t.string :gender
      t.boolean :block
      t.text :content

      t.timestamps
    end

  end
end
