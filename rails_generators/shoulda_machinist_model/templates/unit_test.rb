  require 'test_helper'

class <%= class_name %>Test < ActiveSupport::TestCase

  context "The #{class_name} model" do

  	setup do
  		@<%= file_name %> = <%= class_name %>.make
  	end

    subject { @<%= file_name %> }

  <% for attribute in attributes -%>
    should_have_db_column :<%= attribute.name %>
  <% end -%>
  end

end

