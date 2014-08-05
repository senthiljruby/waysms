require "rubygems"
require "mechanize"

module WaySms
  class SmsSender
    def initialize(user_phone, password)
      @sender = user_phone
      @password = password
    end
    
    def send(recipient, message)
      agent = Mechanize.new
      main_page = agent.get("http://www.way2sms.com")
      dummy_site = main_page.form("dummy").action
      page = agent.get(dummy_site + "content/index.html")
      
      login_form = page.form("lgnFrm")
      login_form.username = @sender
      login_form.password = @password
      page = agent.submit(login_form)

      token_form = page.form("ebFrm")
      token_id = token_form["Token"]

      page = agent.get dummy_site + "sendSMS?Token=" + token_id

      page.forms.any? { |form| form.name == "smsFrm" }
 
      compose_form = page.form("smsFrm")
      compose_form.field_with(:name => "mobile").value = recipient
      compose_form["message"] = message
      compose_form.action = "/smstoss.action?Token=" + token_id
      button = compose_form.button_with(:name => "Send")
      page = agent.submit(compose_form, button)
      puts "Message Send successfully"
    end
  end
end