module ApplicationHelper
  def status_converter(status,truthy: 'Active', falsey: 'Pending')
    status ? content_tag(:span, truthy, class: 'label label-success label-sm') : content_tag(:span, falsey, class: 'label label-warning label-sm')
  end

  def time_ago(time)
    "#{time_ago_in_words(time) } ago"
  end

  def double_digit_number(n)
    '%02d' % n
  end

  def nav_active_class(for_page, current_page)
    for_page == current_page ? 'active':'inactive'
  end
end
