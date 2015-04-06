class Contact

  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def to_s
   "Id: #{@id}\nName: #{@first_name} #{@last_name}\nEmail: #{@email}\nNotes: #{@notes}"
  end

  def set_attribute(attribute_name, new_value)
    send(attribute_name + "=", new_value)
  end

  def get_attribute(attribute_name)
    send(attribute_name)
  end

end