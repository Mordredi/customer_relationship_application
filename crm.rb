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


  # MAIN_MENU = [
  #   [:add_new_contact, "Add a contact"],
  #   [:modify_contact, "Modify a contact"],
  # ]

  # def do_menu(menu)
  #   menu.each_with_index do |(method_name, description), i|
  #     puts "[#{i+1}] #{description}"
  #   end
  #   puts "[0] Exit program"

  #   loop do
  #     puts "Make choice now! >"
  #     choice = gets.chomp.to_i

  #     if choice <= menu.size and choice >= 0
  #       break
  #     else
  #       puts "Unknown thingy"
  #     end
  #   end

  #   exit if choice == 0
  #   send(menu[choice-1].first)
  # end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Diplay all contacts"
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
    main_menu
  end

  def modify_existing_contact
    id = choose_id
    confirm = confirm_id(id)
    if confirm == "yes"
      contact = @rolodex.find(id)
      attribute = select_attr
      if attribute == 1
        puts "First name:"
        contact.first_name = gets.chomp
        response
      elsif attribute == 2
        puts "Last name:"
        contact.last_name = gets.chomp
        response
      elsif attribute == 3
        puts "Email:"
        contact.email = gets.chomp
        response
      elsif attribute == 4
        puts "Notes:"
        contact.notes = gets.chomp
        response
      end
    elsif confirm == "no"
      response
    else
      puts "\e[H\e[2J"
      puts "Please select yes or no"
      main_menu
    end
  end

  def display_all_contacts
    @rolodex.display_contacts
    main_menu
  end

  def display_attribute
    id = choose_id
    confirm = confirm_id(id)
    if confirm == "yes"
      contact = @rolodex.find(id)
      attribute = select_attr
      if attribute == 1
        puts contact.first_name
        response
      elsif attribute == 2
        puts contact.last_name
        response
      elsif attribute == 3
        puts contact.email
        response
      elsif attribute == 4
        puts contact.notes
        response
      end
    else
      main_menu
    end
  end

  def delete_contact
    id = choose_id
    confirm = confirm_id(id)
    if confirm == "yes"
      @rolodex.delete_contact(id)
    else
      main_menu
    end
    response
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
    gets.chomp.to_i
  end

  def response
    puts "Thanks"
    puts ""
    main_menu
  end
end

CRM.run("CRM")