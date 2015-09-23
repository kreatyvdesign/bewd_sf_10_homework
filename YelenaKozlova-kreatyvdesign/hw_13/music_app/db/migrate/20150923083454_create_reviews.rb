class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.string :name
      t.integer :rating
      t.text :comment

      t.timestamps null: false
    end
  end
end
