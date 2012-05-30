class CreateMatchGuesses < ActiveRecord::Migration
  def change
    create_table :match_guesses do |t|
      t.integer :match_id
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
