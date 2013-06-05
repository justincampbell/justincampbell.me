require "spec_helper"

describe ApplicationHelper do
  describe "#markdown" do
    subject { helper.markdown(markdown).strip }

    let(:markdown) { "Body" }

    it "renders to html" do
      should == "<p>Body</p>"
    end

    context "with an h1" do
      let(:markdown) { "# Header" }

      it "adds 3 levels" do
        should == "<h4>Header</h4>"
      end
    end

    context "with a twitter username" do
      let(:markdown) { "@justincampbell" }

      it "linkifies it" do
        should include(
          "<a href=\"#{klass::TWITTER_URL_PREFIX}justincampbell\">@justincampbell</a>"
        )
      end
    end

    context "with an email address" do
      let(:markdown) { "justin@justincampbell.me" }

      it "does not convert it to a twitter link" do
        should_not include(
          "#{klass::TWITTER_URL_PREFIX}"
        )
      end
    end

    context "with an instance variable in code" do
      let(:markdown) { "`@ivar`\n\n```rb\n@ivar\n```" }

      it "does not convert it to a twitter link" do
        should_not include(
          "#{klass::TWITTER_URL_PREFIX}ivar"
        )
      end
    end
  end
end
