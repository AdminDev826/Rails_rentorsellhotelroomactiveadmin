ActiveAdmin.register Blog do
  permit_params :title, :description, :image, :author
  
  form do |f|
    f.inputs "Blog Details" do
      f.input :title
      f.input :author
      f.input :description
      f.input :image
      end
    f.button :Submit
  end
end
