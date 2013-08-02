require 'spec_helper'

describe Publication do
  before(:each) do
    @attr = { :title => 'Sample Publication Title', :summary => 'This is a sample summary.' }
  end

  describe 'instantiation' do
    it 'should require a title' do
      no_title_publication = Publication.new(@attr.merge(:title => ''))
      no_title_publication.should_not be_valid
    end 

    it 'should require a summary' do
      no_summary_publication = Publication.new(@attr.merge(:summary => ''))
      no_summary_publication.should_not be_valid
    end
  end
end
