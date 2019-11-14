class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :host
      t.string :category

      t.timestamps
    end
  end
end
