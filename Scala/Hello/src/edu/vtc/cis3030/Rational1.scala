package edu.vtc.cis3030

/**
 * This class represents rational numbers (fractions). This version is inspired by the example in Chapter 6 of PiS.
 * It illustrates how to set up a simple but useful immutable class.
 * 
 * @param n The numerator.
 * @param d The denominator.
 */
class Rational1(n: Int, d: Int = 1) {
  require(d != 0, "Invalid Rational1 denominator")

  private val commonDivisor = gcd(n.abs, d.abs)
  private val signFlag = integerSign(n) * integerSign(d)
  val numerator: Int = signFlag * (n.abs / commonDivisor)
  val denominator: Int = d.abs / commonDivisor

  override def toString = numerator + "/" + denominator

  def +(that: Rational1) =
    new Rational1(
      numerator * that.denominator + that.numerator * denominator,
      denominator * that.denominator)

  def -(that: Rational1) =
    new Rational1(
      numerator * that.denominator - that.numerator * denominator,
      denominator * that.denominator)

  def *(that: Rational1) =
    new Rational1(numerator * that.numerator, denominator * that.denominator)

  def /(that: Rational1) =
    new Rational1(numerator * that.denominator, denominator * that.numerator)

  private def integerSign(n: Int) =
    if (n < 0) -1 else 1

  private def gcd(a: Int, b: Int): Int =
    if (b == 0) a else gcd(b, a % b)
}


/**
 * The companion object's apply method allows one to create Rationals without using 'new.' This is convenient.
 */
object Rational1 {
  def apply(n: Int, d: Int = 1) = new Rational1(n, d)
}
