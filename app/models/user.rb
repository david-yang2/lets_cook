class User < ApplicationRecord
    def password=(password)

        #dn instead of saving actual password
            #dn use BCrypt to hash it and save it to password_digest column in DB
            #dn since we dont have a password column in DB and we don't actually
            #dn want to save the raw password
        self.password_digest = BCrypt::Password.create(password)
    end

    
end
