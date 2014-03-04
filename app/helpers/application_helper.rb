module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "GGbets, follow and bet on your favorite E-sports teams"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end