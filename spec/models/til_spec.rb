require 'spec_helper'

describe Til do
  subject { thing }
  let(:thing) { Til.create(body: body, slug: slug) }

  let(:body) { "Line 1\n\nLine 2" }
  let(:slug) { nil }

  its(:first_line) { should eq("Line 1") }
  its(:title) { should eq("TIL: Line 1") }

  describe "#slug" do
    subject { thing.slug }

    it { should eq("line-1") }

    context "with a valid slug" do
      let(:slug) { "new-slug" }

      it { should eq(slug) }
    end

    context "with an invalid slug" do
      let(:slug) { "Invalid slug!" }

      it { should eq("invalid-slug") }
    end
  end
end
