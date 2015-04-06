require_relative "contact"
require_relative "rolodex"

class CRM
  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def self.run(name)
    crm = CRM.new(name)
    puts "\e[H\e[2J"
    puts "Welcome!"
    puts ""
    crm.main_menu
  end


  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact"
    puts "[6] Exit"
    puts ""
    puts "Enter a number:"
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def call_option(user_selected)
    case user_selected
    when 1
      add_new_contact
    when 2
      modify_existing_contact
    when 3
      display_all_contacts
    when 4
      display_attribute
    when 5
      delete_contact
    when 6
      exit
    else
      puts "\e[H\e[2J"
      puts "unknown choice: #{user_selected}"
      puts ""
      main_menu
    end
  end

 def add_new_contact
    puts "\e[H\e[2J"
    puts "Please supply the following information"
    puts "First name:"
    first_name = gets.chomp
    puts "Last name:"
    last_name = gets.chomp
    puts "Email:"
    email = gets.chomp
    puts "Any notes about you?"
    notes = gets.chomp
    contact = Contact.new(first_name, last_name, email, notes)
    @rolodex.add_contact(contact)
    puts "\e[H\e[2J"
    puts "Thank you very much #{first_name}! ID is: #{contact.id}"
    puts ""
    main_menu
  end



  ATTRIBUTE_NAMES = {
    1 => "first_name",
    2 => "last_name",
    3 => "email",
    4 => "note"
  }

  def modify_existing_contact
    puts "\e[H\e[2J"
    id = choose_id
    confirm = confirm_id(id)
    if confirm == "yes"
      contact = @rolodex.find(id)
      attr = select_attr
      puts "Attribute value is #{contact.get_attribute(attr)}"
      puts "Please enter your modification"
      new_value = gets.chomp
      contact.set_attribute(attr, new_value)
      puts "\e[H\e[2J"
      puts contact
      main_menu
    elsif confirm == "no"
      puts "\e[H\e[2J"
      main_menu
    else
      puts "\e[H\e[2J"
      puts "Please select yes or no"
      modify_existing_contact
    end
  end

  def display_all_contacts
    puts "\e[H\e[2J"
    @rolodex.display_contacts
    main_menu
  end

  def display_attribute
    puts "\e[H\e[2J"
    id = choose_id
    confirm = confirm_id(id)
    if confirm == "yes"
      contact = @rolodex.find(id)
      attr = select_attr
      puts "\e[H\e[2J"
      puts "Attribute value is #{contact.get_attribute(attr)}"
      puts ""
      main_menu
    else
      puts "\e[H\e[2J"
      main_menu
    end
  end

  def delete_contact
    puts "\e[H\e[2J"
    id = choose_id
    confirm = confirm_id(id)
    if confirm == "yes"
      @rolodex.delete_contact(id)
    else
      puts "\e[H\e[2J"
      main_menu
    end
    main_menu
  end

  def choose_id
    puts "Please enter id for the contact"
    gets.chomp.to_i
  end

  def confirm_id(id)
    puts "You chose id number #{id}. Is this correct? yes or no"
    gets.chomp.downcase
  end

  def select_attr
    puts "Please select attribute"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Notes"
    ATTRIBUTE_NAMES[gets.chomp.to_i]
  end

end

CRM.run("CRM")