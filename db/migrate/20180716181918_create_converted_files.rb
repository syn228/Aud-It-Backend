class CreateConvertedFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :convertedfiles do |t|
      t.string :name
      t.integer :user_id
      t.integer :size
      t.string :text

      t.timestamps
    end
  end
end
