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

  test "the Person should have a name, url, and job title" do
    person = @items.first
    assert_equal ['Jason Ronallo'], person.properties['name']
    assert_equal ['http://twitter.com/ronallo'], person.properties['url']
    assert_equal ['Associate Head of Digital Library Initiatives'], person.properties['jobTitle']
  end

end
