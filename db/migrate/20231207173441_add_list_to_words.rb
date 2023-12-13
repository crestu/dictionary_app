class AddListToWords < ActiveRecord::Migration[7.1]
  def change
    add_reference :words, :list, foreign_key: true
  end
end
