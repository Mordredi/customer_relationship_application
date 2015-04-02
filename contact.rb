class Contact

  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
    @id
  end

  def inspect
    fields = [:first_name, :last_name, :email, :notes, :id]
    str = fields.map{|field| "#{field}: #{send(field)}" }.join(", ")
    "#<Contact: #{str}>"
  end

  alias_method :to_s, :inspect

end