ActiveAdmin.register Question do

  permit_params :question, answer_attributes: [:id, :question_id, :answer, :_destroy]
  
  form multipart: true do |f|
    f.inputs "Question Details" do
      f.input :question
      f.inputs "Answer" do
        f.has_many :answer, allow_destroy: true do |p|
          p.input :answer, as: :ckeditor
        end
      end
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :question
      row "Answer" do
        raw(question.answer.answer)
      end
    end
    
    active_admin_comments
  end

end
