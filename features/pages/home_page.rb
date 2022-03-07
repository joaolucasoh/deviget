class HomePage
    include Capybara::DSL

    def initialize
        get_page_mappings 'home'
    end

    def search_product(product_name)
        fill_field $mappings['input_field_search'], product_name
        click $mappings['button_field_search']
    end 
end       
