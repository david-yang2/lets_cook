class User < ApplicationRecord

    #dn validation will call this to check the attribute
    attr_reader :password

    validates :username, presences: true

    #if password is bank send that message
    validates :password_digest, presence: { message: 'Password can\'t be blank'}

    #dn make sure password is atleast 6 characters long
    #dn allow_nil: true means:
        #dn validation will pass if @password is nil (desirable b/c:
            #dn @password attribute is only set IF WE CHANGE THE PASSWORD WITH #password=)
    validates :password, length: {minimum: 6, allow_nil:true}


    def password=(password)

        #dn store password in an instance variable but never save this to DB
            #dn @password will not be persisted
        @password = password
        #dn instead of saving actual password
            #dn use BCrypt to hash it and save it to password_digest column in DB
            #dn since we dont have a password column in DB and we don't actually
            #dn want to save the raw password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)

        #dn b/c the digest is already hashed
            #dn use .new rather than .create
                #dn .create creates a Password object by hashing the input
                #dn .new builds a Password object from an existing, string-ified hash
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

end
