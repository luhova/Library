class AddPublisherToBook < ActiveRecord::Migration
  def change
    #add_reference :books, :publisher, index: true
    add_foreign_key :books, :publishers
  end
end
