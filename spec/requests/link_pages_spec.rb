require 'spec_helper'

describe "Link pages" do

  subject { page }

  describe "new link page" do
    before { visit root_path }

    it { should have_field('link_long_url') }
    it { should have_button('Shorten') }


    describe "valid new long url" do
      let(:link) { FactoryGirl.build(:link) }
      before do
        fill_in "link_long_url", with: link.long_url
      end

      it "should create a link" do
        expect { click_button "Shorten" }.to change(Link, :count).by(1)
      end 
    end

    describe "valid duplicate long url" do
      let(:link) { FactoryGirl.create(:link) }
      before do
        fill_in "link_long_url", with: link.long_url
      end

      it "should not create new link" do
        expect { click_button "Shorten" }.to_not change(Link, :count)
      end 

      it "should redirect to existing link's show page" do
        click_button "Shorten"
        current_path.should == showlink_path(link.short_url)
      end
    end

  end  

  describe "show link page" do
    let(:link) { FactoryGirl.create(:link) }
    before { visit showlink_path(link.short_url) }

    it { should have_content(link.long_url) }
    it { should have_content(link.short_url) }
  end
  
end