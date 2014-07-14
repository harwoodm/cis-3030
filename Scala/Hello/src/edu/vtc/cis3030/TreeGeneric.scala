package edu.vtc.cis3030

sealed abstract class TreeGeneric[+A]

case object LeafGeneric extends TreeGeneric
case class NodeGeneric[+A](left: TreeGeneric[A], data: A, right: TreeGeneric[A]) extends TreeGeneric[A]

/**
 * Companion object contains various TreeGeneric processing methods. This is a generic example.
 */
object TreeGeneric {

  class EmptyTreeGenericException(message: String) extends Exception(message)


  def size[A](t: TreeGeneric[A]): Int =
    t match {
      case LeafGeneric => 0
      case NodeGeneric(left, _, right) => size(left) + size(right) + 1
    }


  def insert[A <: Ordered[A]](t: TreeGeneric[A], value: A): TreeGeneric[A] = 
    t match {
      case LeafGeneric => NodeGeneric(LeafGeneric, value, LeafGeneric)
      case NodeGeneric(left, data, right) =>
        if (value == data) NodeGeneric(left, data, right)
        else if (value < data) NodeGeneric(insert(left, value), data, right)
        else NodeGeneric(left, data, insert(right, value))
    }


  def lookup[A <: Ordered[A]](t: TreeGeneric[A], value: A): Boolean =
    t match {
      case LeafGeneric => false
      case NodeGeneric(left, data, right) =>
        if (value == data) true
        else if (value < data) lookup(left, value)
        else lookup(right, value)
    }


  /*
  def min[A](t: TreeGeneric[A]): A = {
    def minHelper(t: TreeGeneric[A], currentMin: A): A =
      t match {
        case LeafGeneric => currentMin
        case NodeGeneric(left, data, _) => minHelper(left, data)
      }

    if (t == LeafGeneric) throw new EmptyTreeGenericException("No minimum element in an empty TreeGeneric")
    else minHelper(t, Int.MaxValue)
  }


  def max[A](t: TreeGeneric[A]): A = {
    def maxHelper(t: TreeGeneric[A], currentMax: A): A =
      t match {
        case LeafGeneric => currentMax
        case NodeGeneric(_, data, right) => maxHelper(right, data)
      }

    if (t == LeafGeneric) throw new EmptyTreeGenericException("No maximum element in an empty TreeGeneric")
    else maxHelper(t, Int.MinValue)
  }
  */

}
