require 'test_helper'

class <%= class_name %>Test < ActiveSupport::TestCase

  context "The #{class_name} model" do
  <% for attribute in attributes -%>
    should_have_db_column :<%= attribute.name %>
  <% end -%>
  end

end

