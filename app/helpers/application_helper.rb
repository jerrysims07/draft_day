module ApplicationHelper
  #returns the proper title for each page.
  def full_title(page_title)
    base_title = "Draft Day"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
