class AddEventRefToUser < ActiveRecord::Migration[7.0]
  def change
    create_table :attended_events do |t|
      t.belongs_to :user
      t.belongs_to :event
    
      t.timestamps
    end
    
    add_column :events, :creator_id, :integer
  end
end
