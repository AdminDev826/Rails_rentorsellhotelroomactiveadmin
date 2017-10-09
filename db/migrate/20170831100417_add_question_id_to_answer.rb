class AddQuestionIdToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :question_id, :integer
  end
end
