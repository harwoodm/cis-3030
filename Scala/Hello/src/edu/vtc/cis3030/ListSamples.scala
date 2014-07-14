package edu.vtc.cis3030

/**
 * This demonstration program illustrates list pattern matching and introduces generic methods.
 */
object ListSamples {

  // Computes the sum of all elements of a list of integers.
  //
  // val myList = List(1, 2, 3)
  // sum(myList) == 6
  //
  def sum(myList: List[Int]): Int =
    myList match {
      case Nil => 0
      case head :: tail => head + sum(tail)
    }

  // Computes the sum and product of a list of elements, returning as a pair.
  //
  // val myList = List(2, 4, 6)
  // sumAndProduct(myList) == (12, 48)
  //
  def sumAndProduct(myList: List[Int]): (Int, Int) =
    myList match {
      case Nil => (0, 1)
      case head :: tail =>
        val (tailSum, tailProduct) = sumAndProduct(tail)
        (head + tailSum, head * tailProduct)
    }

  // Computes the length of a list.
  //
  // val myList = List(10, 20, 30)
  // length(myList) == 3
  //
  def length[A](myList: List[A]): Int =
    myList match {
      case Nil => 0
      case _ :: tail => 1 + length(tail)
    }

  // Converts each element of a list of strings to uppercase.
  //
  // val myList = List("Hello", "World")
  // listUpper(myList) == List("HELLO", "WORLD")
  //
  def listUpper(myList: List[String]): List[String] =
    myList match {
      case Nil => List()
      case head :: tail => head.toUpperCase :: listUpper(tail)
    }

  // Zips two lists into a list of pairs.
  //
  // val myList1 = List(1, 2, 3)
  // val myList2 = List("x", "y", "z")
  // zip(myList1, myList2) == List( (1, "x"), (2, "y"), (3, "z") )
  //
  def  zip[A, B](list1: List[A], list2: List[B]): List[(A, B)] = 
    (list1, list2) match {
      case (Nil, Nil) => List()
      case (head1 :: tail1, Nil) => throw new IllegalArgumentException
      case (Nil, head2 :: tail2) => throw new IllegalArgumentException
      case (head1 :: tail1, head2 :: tail2) => (head1, head2) :: zip(tail1, tail2)
    }

  // Unzips a list of pairs into a pair of lists.
  //
  // val myList = List( (1, "x"), (2, "y"), (3, "z") )
  // unzip(myList) = ( List(1, 2, 3), List("x", "y", "z") )
  //
  def unzip[A, B](myList: List[(A, B)]): (List[A], List[B]) =
    myList match {
      case Nil => (List(), List())
      case (head1, head2) :: tail =>
        val (tail1, tail2) = unzip(tail)
        (head1 :: tail1, head2 :: tail2)
    }

}
