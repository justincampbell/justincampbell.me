class Til < ActiveRecord::Base
  attr_accessible :body, :slug

  before_save :clean_slug

  def first_line
    body.lines.first.strip
  end

  def title
    "TIL: #{first_line.truncate(80)}"
  end

  def to_param
    slug
  end

  private

  def clean_slug
    text = self[:slug] || first_line

    text.downcase!
    text.gsub!(/[^\w]+/, '-') # replace special characters with dashes
    text.gsub!(/^-|-$/, '') # remove dashes from beginning and end

    self[:slug] = text
  end
end
