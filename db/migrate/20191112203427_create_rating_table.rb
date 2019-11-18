class CreateRatingTable < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :course_id
      t.integer :golfer_id
      t.string :review
      t.integer :rating
    end
  end
end
