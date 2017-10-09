ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    end
    
    columns do
      column do
        panel "Recent Properties" do
          ul do
            Property.last(5).map do |property|
              li link_to(property.title, admin_property_path(property))
            end
          end
        end
      end
    end
    
    columns do
      column do
        panel link_to('Recent Newsletter Subscribers', admin_newsletters_path, style: 'color: white; text-decoration: none') do
          ul do
            Newsletter.last(5).map do |newsletter|
              li link_to(newsletter.email, admin_newsletters_path)
            end
          end
        end
      end
    end
    
    columns do
      column do
        panel "Recent Blogs" do
          ul do
            Blog.last(5).map do |blog|
              li link_to(blog.title, admin_blog_path(blog))
            end
          end
        end
      end
    end
    
  end # content
end
