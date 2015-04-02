require_relative "contact"
require_relative "rolodex"

class CRM
  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  MAINMENU = [
    [:add_new_contact, "Add a contact"],
    [:modify_contact, "Modify a contact"],
  ]

  def do_menu(menu)
    menu.each_with_index do |(method_name, description), i|
      puts "[#{i+1}] #{description}"
    end
    puts "[0] Exit program"

    loop do
      puts "Make choice now! >"
      choice = gets.chomp.to_i

      if choice <= menu.size and choice >= 0
        break
      else
        puts "Unknown thingy"
      end
    end

    exit if choice == 0
    send(menu[choice-1].first)
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
      puts "unknown choice: #{user_selected}"
    end
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
    id = choose_id
    confirm = confirm_id(id)
    if confirm == "yes"
      contact = Customer.id == confirm_id
      attribute = select_attr
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
      puts "#{contact.first_name} #{contact.last_name}"
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

  def select_contact(id)
  end


  def select_attr
      puts "Please select number of attribute you wish to change"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] Email"
      puts "[4] Notes"
      attribute = gets.chomp.to_i
    end
end

crm = CRM.new("Hello")
crm.main_menu