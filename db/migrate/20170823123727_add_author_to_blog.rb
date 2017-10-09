class AddAuthorToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :author, :string
  end
end
