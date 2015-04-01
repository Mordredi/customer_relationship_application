class Contact

  attr_accessor :first_name, :last_name, :email, :notes

  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
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
    puts "Thank you very much!"
    main_menu
  end

  def modify_existing_contact
    puts "Please enter id for the contact to be modified"
    chosen_id = gets.chomp.to_i
    puts "You chose id number #{chosen_id}. Is this correct? yes or no"
    confirm = gets.chomp.downcase
    if confirm == "yes"
      puts "Please select number of attribute you wish to change"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] Email"
      puts "[4] Notes"
      attribute = gets.chomp.to_i
      # Need to get to modify user through their id
      if attribute == 1
        puts "First name:"
        first_name = gets.chomp
      elsif attribute == 2
        puts "Last name:"
        last_name = gets.chomp
      elsif attribute == 3
        puts "Email:"
        email = gets.chomp
      elsif attribute == 4
        puts "Notes:"
        notes = gets.chomp
      end
    elsif confirm == "no"
      main_menu
    else
      puts "Please select yes or no"
    end
  end

  def display_all_contacts
  # Code to display all contacts
  end

  def display_attribute
  puts "Please enter id for the contact you would like to view"
  user_id = gets.chomp.to_i
  # Code to display contact by id selected
  end

  def delete_contact
  # Code to delete contact
  end
end
