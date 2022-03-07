$wait = Selenium::WebDriver::Wait.new(timeout: 60)

def fill_field(el, text)
  case el['search_type']
  when 'XPATH', 'ID', 'CLASS'
    element = find(el['value'])
  end
  element.send_keys(text)
end
  
def click(el)
  case el['search_type']
  when 'XPATH', 'ID', 'CLASS'
    find(el['value']).click
  end
end
  
  def get_text(el)
    case el['search_type']
    when 'XPATH', 'ID', 'CLASS'
      find(el['value'], match: :first).text
    end
  end
  
  def scroll_to(startX, startY, endX, endY, time)
  end