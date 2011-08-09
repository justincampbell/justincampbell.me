class ResumeController < ApplicationController
  layout nil
  
  def index
    @md = File.read('public/resume.md')
    
    respond_to do |format|
      format.html
      # format.md # Serve markdown directly from /public
    end
  end
  
end
