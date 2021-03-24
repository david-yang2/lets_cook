class User < ApplicationRecord

    #dn validation will call this to check the attribute
    attr_reader :password

    validates :username, presence: true

    #if password is bank send that message
    validates :password_digest, presence: { message: 'Password can\'t be blank'}

    #dn make sure password is atleast 6 characters long
    #dn allow_nil: true means:
        #dn validation will pass if @password is nil (desirable b/c:
            #dn @password attribute is only set IF WE CHANGE THE PASSWORD WITH #password=)
    validates :password, length: {minimum: 6, allow_nil:true}

    # validates :session_token, presence: true
    # after_initialize :ensure_session_token


    # def self.generate_session_token
    #     SecureRandom::urlsafe_base64(16)
    # end


    # def reset_session_token!
    # self.session_token = self.class.generate_session_token
    # self.save!
    # self.session_token
    # end

    

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
    
    # private
    # def ensure_session_token
    #   # we must be sure to use the ||= operator instead of = or ||, otherwise
    #   # we will end up with a new session token every time we create
    #   # a new instance of the User class. This includes finding it in the DB!
    #   self.session_token ||= self.class.generate_session_token
    # end
end
