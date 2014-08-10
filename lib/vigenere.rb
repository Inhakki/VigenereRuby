class Vigenere

  # This method encodes given message with the given keyword.
  # WHAT THE METHOD DOES:
  # We convert each letter in this method into ASCII number using .ord.
  # Then we add the sums of the two but take the base of 97 out, because
  # each lower case number has a base of 97. When you subtract 97 from
  # each, the base of character a becomes 0. Then you can add the values
  # together to get the Vigenere code letter.
  def self.encode(message, keyword)
    k_array = keyword.split(//)
    message.split(//).each_with_index.map do |letter, index|
      k_code = k_array[index % k_array.length].downcase.ord
      m_code = letter.downcase.ord
      ((m_code + k_code - 97 * 2) % 26 + 97).chr.upcase
    end.join
  end # end self.encode

  # This method decodes the message with a given keyword.
  # WHAT THE METHOD DOES:
  # I am particularly proud of the decoding part, because when you initially
  # reverse the code, you get weird numbers and letters. I thought it would be
  # easier than that, but I realized that negative numbers get converted to
  # different ASCII characters. I'm particularly fond of figuring this out.
  # I solved it by adding 26, the number of letters in the alphabet, to
  # normalize the number to a letter, therefore making up for the negative
  # number that would come out of subtracting the greater number.
  def self.decode(encoding, keyword)
    k_array = keyword.split(//)
    encoding.split(//).each_with_index.map do |letter, index|
      k_code = k_array[index % k_array.length].downcase.ord
      e_code = letter.downcase.ord
      if ( e_code - k_code < 0 )
        ((e_code - k_code) + 97 + 26).chr.upcase
      else
        ((e_code - k_code) + 97).chr.upcase
      end
    end.join
  end # end self.decode

end # end Vigenere class
