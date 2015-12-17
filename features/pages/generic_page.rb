class GenericPage
  include RSpec::Matchers
  attr_accessor :browser
  
  def initialize(browser)
    @browser = browser
  end
  #Expects Watir locator hash: {id: "thing"}
  def element_exists?(el)
    @browser.element(el).exists?
  end
  
  def url
    @browser.url
  end
  
  def title
    @browser.title
  end

end
