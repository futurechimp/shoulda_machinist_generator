require File.dirname(__FILE__) + '/../test_helper'

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

		context 'GET to new' do
		  setup do
		    get :new
		  end

		  should_respond_with :success
		  should_render_template :new
		  should_assign_to :<%= file_name %>
		end

		context 'POST to create' do
		  context "with valid parameters" do
        setup do
         assert_difference('<%= class_name %>.count') do
            post :create, :<%= file_name %> => {  }
          end
        end

        should_redirect_to("the show page") { <%= file_name %>_path(assigns(:<%= file_name %>))}
        should_assign_to :<%= file_name %>
      end

#      context "with invalid parameters" do
#        setup do
#         assert_no_difference('<%= class_name %>.count') do
#            post :create, :<%= file_name %> => {}
#          end
#        end

#        should_respond_with :success
#        should_render_template :new
#        should_assign_to :<%= file_name %>
#      end
		end

		context 'GET to show' do
		  setup do
		    get :show, :id => @<%= file_name %>.to_param
		  end
		  should_respond_with :success
		  should_render_template :show
		  should_assign_to :<%= file_name %>
		end

		context 'GET to edit' do
		  setup do
		    get :edit, :id => @<%= file_name %>.to_param
		  end
		  should_respond_with :success
		  should_render_template :edit
		  should_assign_to :<%= file_name %>
		end

		context 'PUT to update' do
      context "with valid parameters" do
        setup do
          assert_no_difference("<%= class_name %>.count") do
            put :update, :id => @<%= file_name %>.to_param, :<%= file_name %> => {}
          end
        end

        should_redirect_to("the show page") { <%= file_name %>_path(assigns(:<%= file_name %>))}
        should_assign_to :<%= file_name %>
      end

#      context "with invalid parameters" do
#        setup do
#          assert_no_difference("<%= class_name %>.count") do
#            put :update, :id => @<%= file_name %>.to_param, :<%= file_name %> => { }
#          end
#        end

#        should_respond_with :success
#        should_render_template :edit
#        should_assign_to :<%= file_name %>
#      end
		end

		context 'DELETE to destroy' do
		  setup do
        assert_difference('<%= class_name %>.count', -1) do
          delete :destroy, :id => @<%= file_name %>.to_param
        end
      end

      should_redirect_to ("the index page") { <%= table_name %>_path }
		end
  end
end

