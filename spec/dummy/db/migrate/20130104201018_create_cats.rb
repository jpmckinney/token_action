class CreateCats < ActiveRecord::Migration
  def change
    create_table(:cats) do |t|
      t.string :token
    end
  end
end
