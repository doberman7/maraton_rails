class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.belongs_to :deck, index: true
      t.string :question
      t.string :answer
      t.timestamps
    end
  end
end
