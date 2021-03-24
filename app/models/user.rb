class User < ApplicationRecord
    def password=(password)

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
