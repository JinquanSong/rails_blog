module Admin::TagsHelper
  def create_deletable_button(tag)
    if tag.in_use?
      link_to '#' do
        content_tag(:button, 'Delete', class: 'btn btn-xs btn-danger disabled')
      end
     else
      link_to admin_tag_path(tag), method: :delete do
        content_tag(:button, 'Delete', class: "btn btn-xs btn-danger")
      end
    end
  end
end
