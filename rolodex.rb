class Rolodex
  attr_accessor :contacts, :id

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(id)
    @contacts.find { |contact| contact.id == id }
  end

  def display_contacts
    puts "\e[H\e[2J"
    @contacts.each do |contact|
      puts "Id: #{contact.id}"
      puts "Name: #{contact.first_name} #{contact.last_name}"
      puts "Email: #{contact.email}"
      puts "Notes: #{contact.notes}"
      puts ""
    end
  end


  def delete_contact(id)
    @contacts.delete(find(id))
  end
end