package edu.vtc.cis3030

sealed abstract class Tree

case object Leaf extends Tree
case class Node(left: Tree, data: Int, right: Tree) extends Tree

/**
 * Companion object contains various tree processing methods. This example shows a tree of integers.
 */
object Tree {

  class EmptyTreeException(message: String) extends Exception(message)


  def size(t: Tree): Int =
    t match {
      case Leaf => 0
      case Node(left, _, right) => size(left) + size(right) + 1
    }


  def insert(t: Tree, value: Int): Tree = 
    t match {
      case Leaf => Node(Leaf, value, Leaf)
      case Node(left, data, right) =>
        if (value == data) Node(left, data, right)
        else if (value < data) Node(insert(left, value), data, right)
        else Node(left, data, insert(right, value))
    }


  def lookup(t: Tree, value: Int): Boolean =
    t match {
      case Leaf => false
      case Node(left, data, right) =>
        if (value == data) true
        else if (value < data) lookup(left, value)
        else lookup(right, value)
    }


  def min(t: Tree): Int = {
    def minHelper(t: Tree, currentMin: Int): Int =
      t match {
        case Leaf => currentMin
        case Node(left, data, _) => minHelper(left, data)
      }

    if (t == Leaf) throw new EmptyTreeException("No minimum element in an empty tree")
    else minHelper(t, Int.MaxValue)
  }


  def max(t: Tree): Int = {
    def maxHelper(t: Tree, currentMax: Int): Int =
      t match {
        case Leaf => currentMax
        case Node(_, data, right) => maxHelper(right, data)
      }

    if (t == Leaf) throw new EmptyTreeException("No maximum element in an empty tree")
    else maxHelper(t, Int.MinValue)
  }

}
