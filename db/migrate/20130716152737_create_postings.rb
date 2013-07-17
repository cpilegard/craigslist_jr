class CreatePostings < ActiveRecord::Migration
  def change
  	create_table :postings do |t|
  		t.string  :title
  		t.text    :description
  		t.integer :category_id
  		t.timestamps
  	end
  end
end
