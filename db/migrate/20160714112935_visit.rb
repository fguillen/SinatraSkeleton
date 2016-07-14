class Visit < ActiveRecord::Migration
  def change
    create_table(:visits) do |t|
      t.column :datestamp, :datetime

      t.timestamps
    end
  end
end
