module ApplicationHelper
  BASE_HEADER_TITLE = "ホーム".freeze
  def header_title(page_title)
     if page_title.blank?
      BASE_HEADER_TITLE
     else
      "#{page_title}"
     end
  end
end
