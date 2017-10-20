class CreateGoGamificationScorings < ActiveRecord::Migration[5.1]
  def change
    create_table :go_gamification_scorings do |t|
      t.references :task
      t.references :subjectable, polymorphic: true

      t.timestamps
    end
  end
end
