class ResumeController < ApplicationController
  layout nil

  def index
    @md = File.read("public/resume/JustinCampbell.md")

    respond_to do |format|
      format.html
      format.markdown { render :text => @md }
      format.text     { render :text => plaintext(:markdown => @md) }
    end
  end

  private

  def plaintext(options)
    text = options[:markdown]

    [
      [/^\#{1,2} +(.*)$/, "#{'\1'}\n"], # Replace heading levels 1 and 2 with just the text and a space on the next line
      [/^### +(.*)$/, "#{'\1'}"], # Replace heading level 3 with just the text
      [/^> +(.*)$/, '\1'], # Remove > block prefixes
      [/^(\s*)\* *(.*)$/, '\1- \2'], # Replace bullets with dashes
      [/--/, '-'], # Replace em dash with dash
      [/- \[(.*)\]\((.*)\)/, '- \1:'], # Replace links in a list with just the text and a semicolon
      [/\[(.*)\]\((.*)\)/, '\2'], # Replace other links with just the url
      [/\*\*(.*)\*\*/, '\1'], # Remove bold text
      [/mailto\:/, ''], # Remove mailto: uris
      [/http\:\/\//, ''], # Remove http: uris
      [/\n{2,}/, "\n\n"], # Remove any double-blank spaces
      [/\ +$/, ''], # Remove any whitespace at the end of a line
      [/^([A-Za-z.,\/\- ]+)\n(.+), ([A-Z]+)$/, '\1, \2, \3'], # Format company and city on one line
      [/\n\n-/, "\n-"] # Remove empty lines before a bulleted list
    ].each do |sub|
      text.gsub! sub.first, sub.last
    end

    text << "\n" unless text.last == "\n" # Ensure a newline exists at the end of the file

    text
  end

end
