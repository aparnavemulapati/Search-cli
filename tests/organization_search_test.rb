require 'test/unit'
require 'json'
require './entities/searchable_entity.rb'
require './entities/organization.rb'
class OrganizationSearchTest < Test::Unit::TestCase
  # When search key is found
  def test_positive_case
    data = JSON.parse(File.read(Organization::JSON_FILENAME))
    data[0].each do |key, val|
      results = Organization.new(key, val.to_s).search
      assert_block("It must return the entire record if a search result in found in that object") { results.include?(data[0]) }
    end
  end

  # When an invalid search key is provided
  def test_invalid_search_key
    key = 'asbhjfkds'
    val = 'jahfjg'
    results = Organization.new(key, val).search
    assert_equal results, [], 'It must return an empty array if no valid search field is provided'
  end

  # When the search value is not found
  def test_missing_search_value
    key = '_id'
    val = '8098765432'
    results = Organization.new(key, val).search
    assert_equal results, [], 'It must return an empty array if no search result is found'
  end

  # Test for string case insensitive search
  def test_case_insensitivity
    data = JSON.parse(File.read(Organization::JSON_FILENAME))
    key = 'name'
    val = data[0]['name'].downcase
    results = Organization.new(key, val).search
    assert_block('The search must ignore string case while matching') { results.include?(data[0]) }
  end
end

