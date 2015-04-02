require_relative "contact"
require_relative "rolodex"

class CRM
  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Diplay all contacts"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact"
    puts "[6] Exit"
    puts "Enter a number:"
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    display_all_contacts if user_selected == 3
    display_attribute if user_selected == 4
    delete_contact if user_selected == 5
    return if user_selected == 6
  end

 def add_new_contact
    puts "Welcome!"
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
    puts "Thank you very much #{first_name}!"
    main_menu
  end

  def modify_existing_contact
    confirm = choose_id
    if confirm == "yes"
      select_attr
      if attribute == 1
        puts "First name:"
        contact.first_name = gets.chomp
        main_menu
      elsif attribute == 2
        puts "Last name:"
        contact.last_name = gets.chomp
        main_menu
      elsif attribute == 3
        puts "Email:"
        contact.email = gets.chomp
        main_menu
      elsif attribute == 4
        puts "Notes:"
        contact.notes = gets.chomp
        main_menu
      end
    elsif confirm == "no"
      main_menu
    else
      puts "Please select yes or no"
    end
  end

  def display_all_contacts
    @rolodex.contacts.each do |contact|
      puts "#{contact.first name} #{contact.last_name}"
    end
    main_menu
  end

  def display_attribute
    chosen_id = choose_id
    confirm = confirm_id(chosen_id)
    if confirm == "yes"
      select_attr
      puts contact.first_name if attribute == 1
      puts contact.last_name if attribute == 2
      puts contact.email if attribute == 3
      puts contact.notes if attribute == 4
    end
    main_menu
  end

  def delete_contact
    chosen_id = choose_id
    confirm = confirm_id(chosen_id)
    if confirm == yes
      @rolodex.id.find(chosen_id).delete
    end
    main_menu
  end

  def choose_id
    puts "Please enter id for the contact to be modified"
    gets.chomp.to_i
  end

  def confirm_id(id)
    puts "You chose id number #{id}. Is this correct? yes or no"
    gets.chomp.downcase
  end

  def select_attr
    contact = @rolodex.id.find(id)
      puts "Please select number of attribute you wish to change"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] Email"
      puts "[4] Notes"
      attribute = gets.chomp.to_i
    end
  @rolodex = Rolodex.new
end