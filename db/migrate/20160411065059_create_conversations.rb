class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :content
      t.datetime :time

      t.timestamps null: false
    end
  end
end
