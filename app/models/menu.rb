#dn can read, write and query specific entries in the database
#dn instead of getting back raw SQL, we will get Menu objects

#dn for every column that exists, rails will create getter and setter for you
class Menu < ApplicationRecord

  #dn instead of throwing a long error message from SQL when input label is incorrect
    #dn the error will come from our model which is a lot shorter
  validates :label, presence: true

  #dn checks to see if the label is valid
  validate :check_label

  def check_label
    #dn if label is not one of the options in the array, throw an error
    unless ["breakfast", "lunch", "dinner"].include? self.label
      error[:name] << "Please pick a correct label for the menu"
    end
  end
end
