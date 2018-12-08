module ApplicationHelper
  def full_title(page_title = '')
    base_title = "GHBlog"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def bootstrap_class_for(name)
    {
      success: "alert-success",
      error:   "alert-danger",
      danger:  "alert-danger",
      alert:   "alert-warning",
      notice:  "alert-info",
    }[name.to_sym] || name
  end
end
