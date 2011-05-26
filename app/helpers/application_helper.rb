module ApplicationHelper
  BREADCRUMB_SEPERATOR = '/'
  def title
    if @title
      "#{@title} | Desk Stats"
    else
      'Desk Stats'
    end
  end

  def action_items
    if @action_items
      raw(@action_items.map do |k,v|
        if k.include? 'Delete'
          link_to k, v, :method => :delete, :confirm => 'Are you sure you want to delete this? The action cannot be undone.', :class => 'button'
        else
          link_to k, v, :class => 'button'
        end
      end.join(''))
    end
  end

  def breadcrumbs
    if @breadcrumbs
      raw(@breadcrumbs.map {|k,v| link_to k, v}.join(content_tag(:span, BREADCRUMB_SEPERATOR, :class => 'breadcrumb_seperator')))
    end
  end
end
