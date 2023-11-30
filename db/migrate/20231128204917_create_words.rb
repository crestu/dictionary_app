class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :word
      t.text :definition
      t.references :list, foreign_key: true


      t.timestamps
    end
  end
end
