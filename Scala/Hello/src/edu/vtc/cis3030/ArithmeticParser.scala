package edu.vtc.cis3030

import scala.util.parsing.combinator._

/**
 * This class parses simple arithmetic expressions.
 */
class ArithmeticParser extends JavaTokenParsers {
  def expr  : Parser[Double] = term ~ rep("+" ~> term ^^ { case term =>  term } |
                                          "-" ~> term ^^ { case term => -term } ) ^^
    { case term ~ terms => term + terms.sum }

  def term  : Parser[Double] = factor ~ rep("*" ~ factor ^^ { case _ ~ factor =>     factor } |
                                            "/" ~ factor ^^ { case _ ~ factor => 1.0/factor } ) ^^
    { case factor ~ factors => factor * factors.product }

  def factor: Parser[Double] = floatingPointNumber ^^ { _.toDouble } | "(" ~> expr <~ ")"
}

/**
 * A test program for the ArithmeticParser class.
 */
object Main extends ArithmeticParser {

  def main(args: Array[String]): Unit = {
    println("input : "+ args(0))
    println(parseAll(expr, args(0)))
  }

}
