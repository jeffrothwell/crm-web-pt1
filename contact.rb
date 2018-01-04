gem "activerecord", "=4.2.10"
require "mini_record"
require "active_record"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!

at_exit do
  ActiveRecord::Base.connection.close
end

# class Contact
#
#   # attr_accessor :first_name, :last_name, :email, :notes
#
#   @@contacts = []
#   @@id = 1
#   # This method should initialize the contact's attributes
#   def initialize(first_name, last_name, email, notes = "N/A")
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @notes = notes
#
#     @id = @@id
#     @@id += 1
#   end
#
#   # This method should call the initializer,
#   # store the newly created contact, and then return it
#   def self.create(first_name, last_name, email, notes = "N/A")
#     new_contact = Contact.new(first_name, last_name, email, notes)
#     @@contacts << new_contact
#     new_contact
#   end
#
#   # This method should return all of the existing contacts
#   def self.all
#     @@contacts
#   end
#
#   # This method should accept an id as an argument
#   # and return the contact who has that id
#   def self.find(id)
#     @@contacts.each do |contact|
#       if contact.id == id
#         return contact
#       end
#     end
#     return
#   end
#
#   # This method should allow you to specify
#   # 1. which of the contact's attributes you want to update
#   # 2. the new value for that attribute
#   # and then make the appropriate change to the contact
#   def update(attribute, new_value)
#     # I believe this will allow me to access the writer
#     # for the attribute, and run this method on the self
#     # object on which the update method is called
#     # never mind, it won't work, it will literally
#     # read this and try to run some .attribute method
#     # Dan suggested looking up the send method
#     # self.attribute = new_value
#     # check out this handy case - when stuff
#     case attribute
#       when "first_name"
#         @first_name = new_value
#       when "last_name"
#         @last_name = new_value
#       when "email"
#         @email = new_value
#       when "notes"
#         @notes = new_value
#     end
#     # here's the send thing Dan talked about
#     # send "#{attribute}=", new_value
#     return self
#   end
#
#   # This method should work similarly to the find method above
#   # but it should allow you to search for a contact using attributes other than id
#   # by specifying both the name of the attribute and the value
#   # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
#   def self.find_by(attribute, value)
#     @@contacts.each do |contact|
#       case attribute
#         when "first_name"
#           if value == contact.first_name
#             return contact
#           end
#         when "last_name"
#           if value == contact.last_name
#             return contact
#           end
#         when "email"
#           if value == contact.email
#             return contact
#           end
#         when "id"
#           if value == contact.id
#             return contact
#           end
#       end
#     end
#     return #return nil if we get to this point, no contact found
#   end
#
#   # This method should delete all of the contacts
#   def self.delete_all
#     @@contacts = []
#   end
#
#   def full_name
#     "#{first_name} #{last_name}"
#   end
#
#   # This method should delete the contact
#   # HINT: Check the Array class docs for built-in methods that might be useful here
#   def delete
#     @@contacts.delete(self)
#   end
#
#   # Feel free to add other methods here, if you need them.
#   def first_name
#     @first_name
#   end
#
#   def last_name
#     @last_name
#   end
#
#   def email
#     @email
#   end
#
#   def notes
#     @notes
#   end
#
#   def id
#     @id
#   end
#
#   def first_name=(first_name)
#     @first_name = first_name
#   end
#
#   def last_name=(last_name)
#     @last_name = last_name
#   end
#
#   def email=(email)
#     @email = email
#   end
#
#   def notes=(notes)
#     @notes = notes
#   end
#
# end
