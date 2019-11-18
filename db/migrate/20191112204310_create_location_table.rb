class CreateLocationTable < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :zip
      t.integer :course_id
    end
  end
end
