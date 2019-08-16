module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

 def full_title(page_title)
  base_title = "Dice Media HQ"
  page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
 end

end
