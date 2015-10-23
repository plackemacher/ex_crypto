defmodule ExCrypto do
  
  @doc """
  Returns random characters in "blocks". Each block is a string 
  of 4 chars.  Each block represents 24 bits of entropy, base64 encoded.

  Useful for generating unique strings for use in file names.
  """
  @spec rand_chars(Integer.t) :: String.t
  def rand_chars(num_chars) do
    block_bytes = 3
    block_chars = 4
    block_count = div(num_chars, block_chars)
    block_partial = rem(num_chars, block_bytes)
    if block_partial > 0 do
      block_count = block_count + 1
    end
    rand_string = Base.url_encode64(:crypto.rand_bytes(block_count * block_bytes))
    String.slice(rand_string, 0, num_chars)
  end

end