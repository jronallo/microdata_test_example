require 'test_helper'

class MicrodataTest < ActionDispatch::IntegrationTest
  setup do 
    path = examples_path
    visit path
    @items = Microdata::Document.new(page.body, path).extract_items
  end

  test "the top level item is a schema.org/Person" do
    assert_equal ['http://schema.org/Person'], @items.first.type
  end
  
end
