require 'spec_helper'

describe Project do


  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @project = user.projects.build(title: "Cleaning", location: "Boulder" ,user_id: user.id)
  end

  subject { @project }

  it { should respond_to(:title) }
  it { should respond_to(:location) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  it { should respond_to(:user) }
  its(:user) { should eq user }

  describe "when user_id is not present" do
  	before { @project.user_id = nil }
  	it { should_not be_valid }
  end

  #pending "add some examples to (or delete) #{__FILE__}"
end
