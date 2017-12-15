class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.text :om_text
      t.string :om_title
      t.text :bidrag_left
      t.string :bidrag_l_title
      t.text :bidrag_right
      t.string :bidrag_r_title

      t.timestamps
    end
  end
end
