require 'rspec/expectations'

class SearchResultPage
    include Capybara::DSL
    include RSpec::Matchers

    def initialize
        get_page_mappings 'searchresults'
    end

    def check_product_name_in_the_list(product_name)
        @product_name = product_name
        @all_products_results = get_text $mappings['product_container']
        @all_products_results.include?(@product_name)
    end

    def check_index_page(page_index)
        execute_script('window.scroll(0,10000);')
        click_button "#{page_index}"
        current_url.include?("page=#{page_index}")
    end
    
    def check_product_amount_purchased(product_index)
        @product_index = product_index.to_i
        @product_index = @product_index - 1
        page.all('h1', text: @product_name)[@product_index]
        @amount_purchased = page.all('span._1kNf9')[@product_index].text
    end

    def compare_min_total_amount_purchased(least)
        @amount_purchased = @amount_purchased.delete("^0-9")
        @amount_purchased = @amount_purchased.to_i
        least = least.to_i
        if @amount_purchased >= least
            puts "Yeah! We had the minimum number of products purchased!"
        else
            puts "Nops, the minimum number of products purchased hadn't purchased yet"
        end
    end
end