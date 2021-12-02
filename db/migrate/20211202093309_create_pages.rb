class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :header
      t.text :body
      t.string :ancestry, index: true

      t.timestamps
    end
  end
end
