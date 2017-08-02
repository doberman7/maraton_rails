class CreateUserDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_decks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :deck, index: true
      t.timestamps
    end
  end
end
