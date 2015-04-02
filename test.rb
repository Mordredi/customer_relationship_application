require_relative "crm"

r = Rolodex.new
r.add_contact(Contact.new(*["12"]*4))

puts r.contacts