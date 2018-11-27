require 'encryptor'
require 'cgi'

module PlanitApp
  # Converts a string to a hash
  class Security
    SALT = 'MakeITvery!@#$%^'
    SECRET_KEY = 'provided-by-Snowpal'
    IV = OpenSSL::Cipher::Cipher.new('aes-256-cbc').random_iv

    def hashified_string string
      hash = string.delete(' ').split(',').map { |m| Hash[*m.split('=')] }.map(&:to_a).flatten(1).reduce({}) { |h, (k, v)| h[k]=v; h }
      hash
    end

    def decrypt_authorization_header encrypted_data
      auth_fields = hashified_string encrypted_data
      encrypted_value = CGI.unescape auth_fields["value"]
      decoded_iv = CGI.unescape auth_fields["iv"]

      decrypted_value = Encryptor.decrypt(:value => encrypted_value, :key => SECRET_KEY, :iv => decoded_iv, :salt => SALT)
      decrypted_value = hashified_string decrypted_value
      decrypted_value
    end

    class << self
      def authorization_header(value)
        encrypted_data = CGI.escape (Encryptor.encrypt(:value => value,
                                             :key => SECRET_KEY, :iv => IV, :salt => SALT))
        "iv=#{CGI.escape IV},value=#{encrypted_data}"
      end
    end
  end
end