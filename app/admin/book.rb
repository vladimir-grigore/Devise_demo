ActiveAdmin.register Book do
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
  index do
    column 'Title', :name
    column :author
    column :genre
    column :price do |product|
      number_to_currency product.price
    end

    actions
  end

  filter :name
  filter :author, as: :check_boxes
  filter :book
  filter :price

end
