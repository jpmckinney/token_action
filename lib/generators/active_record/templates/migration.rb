class DeviseCreateTokenActionTokens < ActiveRecord::Migration
  def change
    create_table(:token_action_tokens) do |t|
      t.string :token
      t.string :kind
      t.text :args

      t.timestamps
    end

    add_index :token_action_tokens, :token, :unique => true
  end
end
