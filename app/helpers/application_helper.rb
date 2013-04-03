module ApplicationHelper
  TWITTER_URL_PREFIX = "https://twitter.com/intent/user?screen_name="

  def availability
    ENV['AVAILABILITY']
  end

  def skills
    ENV['SKILLS'].to_s.split
  end

  def title
    string = content_for(:title)
    string.present? ? string : "justincampbell.me"
  end

  def markdown(md, options={})
    redcarpet = Redcarpet::Markdown.new MarkdownRenderer,
      autolink: true,
      fenced_code_blocks: true

    md = link_twitter_usernames(md)

    html = redcarpet.render md

    unless options[:add_header_levels] == false
      # Add 3 levels to header tags, so that # becomes h4
      html.gsub!(/<(\/?)h(\d)>/) { |_| "<#{$1}h#{$2.to_i + (options[:add_header_levels] or 3)}>" }
    end

    more = "\n\n<hr />"
    html = options[:preview] ? html.split(more)[0] : html.gsub(more, "")

    raw html
  end

  private

  def link_twitter_usernames(markdown)
    code_block = false

    result = markdown.split("").inject("") { |buffer, letter|
      code_block = !code_block if letter == "`"
      letter.prepend "twitter:" if not code_block and letter == "@"
      buffer << letter
    }

    result.gsub /twitter:@(\w+)/, "[@\\1](#{TWITTER_URL_PREFIX}\\1)"
  end
end
