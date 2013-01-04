class CreateTokenActionTokens < ActiveRecord::Migration
  def change
    create_table(:token_action_tokens) do |t|
      t.string :token
      t.string :kind
      t.text :args
      t.string :success_url
      t.string :failure_url

      t.timestamps
    end

    add_index :token_action_tokens, :token, :unique => true
  end
end
