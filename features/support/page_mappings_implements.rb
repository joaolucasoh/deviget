require 'yaml'

def get_page_mappings(page)
    dir = "#{Dir.pwd}/features/elements/page_mappings_#{page}.yaml"
    $mappings = YAML.load_file(dir)
end