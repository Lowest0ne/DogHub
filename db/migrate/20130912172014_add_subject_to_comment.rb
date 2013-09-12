class AddSubjectToComment < ActiveRecord::Migration
  def change
    add_column :comments, :subject, :string, null: false
  end
end
