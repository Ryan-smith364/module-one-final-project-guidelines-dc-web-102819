class CreateCourseTable < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :difficulty
      
    end
  end
end


