require 'test_helper'

class ResumeControllerTest < ActionController::TestCase
  context "html" do
    should "be accessible" do
      get :index, :format => :html
      assert_response :success
    end
  end

  context "markdown" do
    should "be accessible via .md" do
      get :index, :format => :md
      assert_response :success
    end

    should "be accessible via .markdown" do
      get :index, :format => :markdown
      assert_response :success
    end
  end

  context "plaintext" do
    should "be accessible via .txt" do
      get :index, :format => :txt
      assert_response :success
    end

    should "be accessible via .text" do
      get :index, :format => :text
      assert_response :success
    end
  end
end
