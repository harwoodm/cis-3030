package edu.vtc.cis3030

/**
 * A program that converts an integer to its binary representation. This demonstration program illustrates both an
 * imperative and a functional approach to solving this problem.
 */
object BinaryString {

  // An imperative method for converting an integer to a binary string.
  def toBinaryString(n: Int) = {
    var number = n
    var result = ""
    while (number > 0) {
      result = if (number % 2 == 0) "0" + result else "1" + result
      number = number / 2
    }
    result
  }

  // A functional method for converting an integer to a binary string.
  def toBinaryStringFunctional(n: Int): String = {
    if (n == 0) ""
    else {
      val binaryDigit = if (n % 2 == 0) "0" else "1"
      toBinaryStringFunctional(n / 2) + binaryDigit
    }
  }

  // Just use one of the methods above to try it out.
  def main(args: Array[String]): Unit = {
    if (args.length == 0)
      println("Error: Must provide a number to convert on the command line!")
    else
      println(toBinaryStringFunctional(args(0).toInt))
  }

}
