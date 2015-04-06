require_relative "crm"
require 'pry'


r = Rolodex.new
r.add_contact(Contact.new("bob", "burger", "bob@burgers.com", "a cool guy"))

actual = r.contacts.first

def test_contact(actual)
  actual.first_name == "bob" &&
  actual.last_name == "burgers" &&
  actual.
end

test_contact(actual)

binding.pry
puts r.contacts