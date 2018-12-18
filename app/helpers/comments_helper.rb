module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment|
      content_tag(:div, render(comment), class: "nested_comments")
    end.join.html_safe
  end
end
