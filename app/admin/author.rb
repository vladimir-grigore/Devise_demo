ActiveAdmin.register Author do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
  index download_links: [:csv, :xlsx]

  csv do
    column :first_name
    column :last_name
  end

  # xlsx(:header_style => {:bg_color => 'C0BFBF', :fg_color => '000000' }) do
  #   delete_columns :id, :created_at, :updated_at
  # end

  sidebar 'Books by this Author', :only => :show do
    table_for Book.joins(:author).where(:author_id => author.id) do |t|
      t.column("Title") { |book| book.name }
    end
  end

end
