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
      t.text :auth_meta_data
      t.text :avatar_meta_data

      t.timestamps
    end

    create_table :posts do |t|
      t.text :title
      t.text :subtitle
      t.text :body
      t.integer :user_id

      t.timestamps
    end

  end
end
