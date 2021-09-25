class User < ApplicationRecord
  validates :first_name, 
    presence: true
  
  validates :last_name, 
    presence: true
  
  validates :phone, 
    numericality: { 
      message: "Should only contain numbers. Do not include - . ( ) spaces" },
    length: { 
      minimum: 10 }

  validates :email,
    format: { with: /(.+)@(.+)/, message: "Email invalid"  },
    uniqueness: { 
      case_sensitive: false },
    length: { 
      minimum: 4, maximum: 254 }



      # validate :check_email

      # private def check_email
      #   uri = URI "https://emailvalidation.abstractapi.com/v1/?api_key=#{API_KEY}&email=#{self.email}"
    
      #   http = Net::HTTP.new uri.host, uri.port
      #   http.use_ssl = true
      #   http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    
      #   request = Net::HTTP::Get.new uri
      #   response = JSON.parse http.request(request)
    
      #   if ! response['is_valid_format']['value'] || ! response['is_mx_found']['value'] || ! response['is_smtp_valid']['value']
      #     errors.add :email, 'is not valid'
      #   end
      # end
    
end
