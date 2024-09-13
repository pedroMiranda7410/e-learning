class CreateLesson < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|

      t.string :title
      t.string :description 
      t.string :image_url
      t.string :video_url
      t.text :content
      t.references :serie, null: false, foreign_key: true

      

      t.timestamps
    end
  end
end
