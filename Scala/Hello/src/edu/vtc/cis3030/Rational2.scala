package edu.vtc.cis3030

/**
 * This class represents rational numbers (fractions). This version illustrates the Ordered trait (see section 19.8 in
 * PiS for more information) and the Numeric type class.
 * 
 * @param n The numerator.
 * @param d The denominator.
 */
class Rational2(n: Int, d: Int = 1) extends Ordered[Rational2] {
  require(d != 0, "Invalid Rational2 denominator")

  private val commonDivisor = gcd(n.abs, d.abs)
  private val signFlag = integerSign(n) * integerSign(d)
  val numerator: Int = signFlag * (n.abs / commonDivisor)
  val denominator: Int = d.abs / commonDivisor

  override def toString = numerator + "/" + denominator

  def +(that: Rational2) =
    new Rational2(
      numerator * that.denominator + that.numerator * denominator,
      denominator * that.denominator)

  def -(that: Rational2) =
    new Rational2(
      numerator * that.denominator - that.numerator * denominator,
      denominator * that.denominator)

  def *(that: Rational2) =
    new Rational2(numerator * that.numerator, denominator * that.denominator)

  def /(that: Rational2) =
    new Rational2(numerator * that.denominator, denominator * that.numerator)

  def compare(that: Rational2) = {
    val leftNumerator = numerator * that.denominator
    val rightNumerator = that.numerator * denominator
    if (leftNumerator < rightNumerator) -1
    else if (leftNumerator == rightNumerator) 0
    else 1
  }

  private def integerSign(n: Int) =
    if (n < 0) -1 else 1

  private def gcd(a: Int, b: Int): Int =
    if (b == 0) a else gcd(b, a % b)
}

/*
class Rational2IsNumeric extends Numeric[Rational2] {
  def compare (x: Rational2, y: Rational2) = x compare y
  def fromInt (x: Int)                     = Rational2(x, 1)
  def minus   (x: Rational2, y: Rational2) = x - y
  def negate  (x: Rational2)               = Rational2(-x.numerator, x.denominator)
  def plus    (x: Rational2, y: Rational2) = x + y
  def times   (x: Rational2, y: Rational2) = x * y
  def toDouble(x: Rational2)               = x.numerator.toDouble / x.denominator.toDouble
  def toFloat (x: Rational2)               = x.numerator.toFloat / x.denominator.toFloat
  def toInt   (x: Rational2)               = x.numerator / x.denominator
  def toLong  (x: Rational2)               = x.numerator.toLong / x.denominator.toLong
}
*/
 
object Rational2 {
  def apply(n: Int, d: Int = 1) = new Rational2(n, d)
  // implicit val ratNumeric = new Rational2IsNumeric
}
