class CreateMyfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :myfiles do |t|
      t.string :filename
      t.string :status

      t.timestamps
    end
  end
end
