require 'spec_helper'

describe Link do
  before { @link = Link.new(short_url: "aw4Zw7bq", long_url: "https://github.com/jraczynski/shortly") }

  subject { @link }

  it { should respond_to(:short_url) }
  it { should respond_to(:long_url) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  it { should be_valid }

  #TODO: DRY this code
  describe "when short_url is not present" do
    before { @link.short_url = " " }
    it { should_not be_valid }
  end

  describe "when long_url is not present" do
    before { @link.long_url = " " }
    it { should_not be_valid }
  end

  describe "when short_url is already taken" do #it should generate new?
    before do
      link_with_same_short_url = @link.dup
      link_with_same_short_url.save
    end

    it { should_not be_valid }
    
  end

end
