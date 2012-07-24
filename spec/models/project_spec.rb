require 'spec_helper'

describe Project do
  describe ".all" do
    subject(:all) { described_class.all }

    it "scopes to only published entries" do
      project1 = Fabricate :project
      project2 = Fabricate :project
      project3 = Fabricate :project, published_at: nil

      all.should =~ [project1, project2]
    end

    it "orders by date descending" do
      dates = [
        1.day.ago, 1.year.ago, 1.week.ago
      ].map { |time| Fabricate :project, published_at: time }

      all.should == dates.sort_by(&:published_at).reverse
    end
  end
end
