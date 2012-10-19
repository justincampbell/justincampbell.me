module ApplicationHelper
  def markdown(md, options={})
    redcarpet = Redcarpet::Markdown.new MarkdownRenderer,
      autolink: true,
      fenced_code_blocks: true

    md.gsub! /@(\w+)/, "[@\\1](https://twitter.com/intent/user?screen_name=\\1)"

    html = redcarpet.render md

    unless options[:add_header_levels] == false
      # Add 3 levels to header tags, so that # becomes h4
      html.gsub!(/<(\/?)h(\d)>/) { |_| "<#{$1}h#{$2.to_i + (options[:add_header_levels] or 3)}>" }
    end

    more = "\n\n<hr />"
    html = options[:preview] ? html.split(more)[0] : html.gsub(more, "")

    raw html
  end
end
