
Given("that I'm search by {string}") do |product_name|
  visit('/')
  @home = HomePage.new
  @product = product_name
  @home.search_product(@product)
end

When('I go to {string}') do |page|
  @search_results = SearchResultPage.new
  expect(@search_results.check_product_name_in_the_list(@product)).to be_truthy
  expect(@search_results.check_index_page(page)).to be_truthy
end

Then('I check the {string} and it has at {string} item bought') do |product_index, least|
  expect(@search_results.check_product_amount_purchased(product_index)).to be_truthy
  @search_results.compare_min_total_amount_purchased(least)
end