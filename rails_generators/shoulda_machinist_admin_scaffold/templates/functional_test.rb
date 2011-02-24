require 'test_helper'

class <%= controller_class_name %>ControllerTest < ActionController::TestCase

  context "The <%= controller_class_name %>Controller" do

  	setup do
  		@<%= file_name %> = <%= class_name %>.make
  	end

		context 'GET to index' do
		  setup do
		    get :index
		  end
		  should_respond_with :success
		  should_assign_to :<%= table_name %>
		end


		context 'GET to show' do
		  setup do
		    get :show, :id => @<%= file_name %>.to_param
		  end
		  should_respond_with :success
		  should_render_template :show
		  should_assign_to :<%= file_name %>
		end

  end
end

