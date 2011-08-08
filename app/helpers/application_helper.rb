module ApplicationHelper
  
  def markdown(md)
    rdiscount = RDiscount.new(
      md,
      :autolink,
      :smart
    )
    
    html = rdiscount.to_html
    
    # Add 3 levels to header tags, so that # becomes h4
    html.gsub!(/<(\/?)h(\d)>/) { |_| "<#{$1}h#{$2.to_i + 3}>" }
    
    raw html
  end
  
end
