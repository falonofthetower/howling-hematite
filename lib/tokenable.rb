module Tokenable
  extend ActiveSupport::Concern

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  def destroy_token
    self.token = nil
  end

  def tokenize
    generate_token
    save(validate: false)
  end

  def detokenize
    destroy_token
    save(validate: false)
  end
end
