class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, foreignkey: true
      t.references :room, foreignkey: true
      t.timestamps
    end
  end
end
