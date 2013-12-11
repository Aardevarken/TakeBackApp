require 'spec_helper'

describe "ProjectPages" do

	subject { page }

	let (:user) { FactoryGirl.create( :user)}
	before { sign_in user}

	describe " Project Creation " do
		before { visit user_path }

		describe "with invalid information " do
			it "should not create a project " do
				expect { follow "Add a New Project"}.not_to change( Project, :count)












  describe "GET /project_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get project_pages_index_path
      response.status.should be(200)
    end
  end
end
