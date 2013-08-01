require 'spec_helper'

describe Research do
  before(:each) do
    @attr = { :topic => 'Sample Research Topic', :start_date => Date.new(1997, 1, 1), :end_date => Date.today,
      :summary => 'Sample research topic goes here.' }
  end

  describe 'instantiation' do
    it 'should require a topic' do
      no_topic_research = Research.new(@attr.merge(:topic => ''))
      no_topic_research.should_not be_valid
    end

    it 'should require a summary' do
      no_summary_research = Research.new(@attr.merge(:summary => ''))
      no_summary_research.should_not be_valid
    end

    it 'should require a faculty ID reference' do
      no_faculty_reference = Research.new(@attr.merge(:faculty_member_id => nil))
      no_faculty_reference.should_not be_valid
    end
  end
end
