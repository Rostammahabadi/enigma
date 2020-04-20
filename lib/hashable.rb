module Hashable

  def create_return_hash(message,decrypt_or_encrypt)
    return_hash = {}
    return_hash[(decrypt_or_encrypt).to_sym] = message
    return_hash[:date] = date
    return_hash[:key] = key
    return_hash
  end

end
