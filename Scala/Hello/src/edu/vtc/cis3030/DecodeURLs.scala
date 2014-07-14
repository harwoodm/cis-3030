package edu.vtc.cis3030

/**
 * A program that decodes URL-encoded characters.
 */
object DecodeURLs {

  // Convert a URL encoded character sequence to the corresponding raw character.
  def decodeCharacter(encodedCharacter: String) = {

    def convert(digitCharacter: Char) =
      if (digitCharacter <= '9') digitCharacter - '0' else digitCharacter - 'A' + 10

    val MSD = encodedCharacter.charAt(1)
    val LSD = encodedCharacter.charAt(2)

    (16 * convert(MSD) + convert(LSD)).toChar
  }


  // Decode any encoded character sequences in the given URL. Return the decoded URL.
  def decode(URL: String): String = {
    val index = URL.indexOf("%")
    if (index == -1) URL
    else {
      val encodedCharacter = URL.substring(index, index + 3).toUpperCase
      val afterOneDecoding =
        URL.substring(0, index) + decodeCharacter(encodedCharacter) + URL.substring(index + 3)
      decode(afterOneDecoding)
    }
  }


  def main(args: Array[String]): Unit = {
    for (arg <- args) {
      println(decode(arg))
    }
  }

}
