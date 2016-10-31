gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter:'sqlite3', database: 'crm-web.sqlite3')

class Contact
     attr_accessor :id

    @@contacts = []
    @@id = 1

    attr_accessor :first_name, :last_name, :email, :note

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

    def self.all
        @@contacts
    end

  def self.find(id)
        @@contacts.find do |contact|
            contact.id == id.to_i
        end
  end

   def update(key,new_value)
        if key == "first_name"
        self.first_name = new_value
        elsif key == "last_name"
        self.last_name = new_value
        elsif key == "email"
        self.email = new_value
        else key == "note"
        self.note = new_value
        end
    end

  def self.find_by(thing1, thing2)
       @@contacts.each do |contact|
           if thing1 == "first_name" && thing2 == contact.first_name
               return contact
            elsif thing1 == "last_name" && thing2 == contact.last_name
                return contact
            elsif thing1 == "email" && thing2 == contact.email
                return contact
            elsif thing1 == "note" && thing2 == contact.note
                return contact
            else
                puts "That is not a searchable term."
            end
        end
  end

  def delete
      @@contacts.delete(self)
  end

  def self.delete_all

    @@contacts.clear
  end

  def full_name
      full_name = "#{first_name} #{last_name}"
  end

 rainbow = ["colour_a", "colour_b", "colour_c", "colour_d"]

end

Contact.create("Meg", "Clarke", "meg@meg.com", "nutmeg")
Contact.create("Steph", "Stephy", "steph@steph", "crazy")
Contact.create("Marty", "McFly", "marty@mcfly.com", "Cool Shoes")
Contact.create("George", "McFly", "george@mcfly.com", "Sci-Fi Author")
Contact.create("Lorraine", "McFly", "lorraine@mcfly.com", "Shock hop champion")
Contact.create("Biff", "Tannen", "biff@tannen.com", "Professional Looser")
Contact.create("Doc", "Brown", "doc@brown.com", "88 kilowats")
