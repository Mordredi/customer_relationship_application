class Contact

  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def to_s
    puts "Id: #{@id}"
    puts "Name: #{@first_name} #{@last_name}"
    puts "Email: #{@email}"
    puts "Notes: #{@notes}"
    puts ""
  end

end