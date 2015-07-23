class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :http_response_code

      t.timestamps null: false
    end
  end
end
