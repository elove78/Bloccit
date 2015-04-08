class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :description
      t.references :post, index: true

      t.timestamps 
    end
    
  end
end
