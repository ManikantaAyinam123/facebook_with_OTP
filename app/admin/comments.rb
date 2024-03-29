ActiveAdmin.register Comment, as: "Postcomments" do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :content, :post_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :post_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :content
    column "Post", :post do |comment|
      comment.post
      comment.post.id
     
    end
    column :user
    column :created_at
    column :updated_at
    actions
  end
  
end
