package edu.vtc.cis3030

import scala.io.Source
import java.util.regex.Pattern

/**
 * A program that manages Firefox bookmarks.
 */
object BookmarkManager {

  // Return true if the line contains an HTML anchor element.
  def hasAnchor(line: String) = {
    val anchorPattern = Pattern.compile("(?i)<a\\s+.*?>.*?</a>")
    val anchorMatcher = anchorPattern.matcher(line)
    anchorMatcher.find
  }

  
  def extractInfo(line: String) = {
    val urlPattern   = Pattern.compile("(?i)href=\"(.*?)\"")
    val urlMatcher   = urlPattern.matcher(line)
    val titlePattern = Pattern.compile("(?i)<a\\s+.*?>(.*?)</a>")
    val titleMatcher = titlePattern.matcher(line)

    if (!urlMatcher.find) ("", "")
    else {
      val url = urlMatcher.group(1)
      val title = if (titleMatcher.find) titleMatcher.group(1) else ""
      (url, title)
    }
  }


  /**
   * Main method checks command line and drives the rest of the program.
   * @param args The command line arguments.
   */
  def main(args: Array[String]) {
    
    def sortCriteria(left: (String, String), right: (String, String)) = {
      val (_, leftTitle) = left
      val (_, rightTitle) = right
      leftTitle < rightTitle
    }
    
    if (args.length == 0)
      Console.err.println("Error: Require the name of a bookmark file.")
    else {
      val rawText = Source.fromFile(args(0)).getLines().toList
      println((rawText filter hasAnchor map extractInfo) sortWith sortCriteria )
    }
  }
}

