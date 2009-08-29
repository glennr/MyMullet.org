class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :email
      t.string :password
      t.boolean :recaptcha
      t.boolean :newsletter

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
