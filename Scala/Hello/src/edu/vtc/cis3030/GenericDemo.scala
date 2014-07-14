package edu.vtc.cis3030

/**
 * This program demonstrates certain aspects of generic programming.
 */
object GenericDemo {

  def min[A <: Ordered[A]](x: A, y: A) =
    if (x < y) x else y

  def main(args: Array[String]) {
    val r1 = Rational2(1, 4)
    val r2 = Rational2(1, 3)
    val result = min(r1, r2)
    println("The minimum is: " + result)

    val ratList = List(Rational2(1, 4), Rational2(1, 3), Rational2(1, 2))
    // println("The sum is: " + ratList.sum)
  }
}
