//java.nio.charset.MalformedInputException: Input length = 1
import scala.io._
import scala.actors._
import scala.xml.parsing
import Actor._

class PageLoader(val url: String) {

  val content = Source.fromURL(url).mkString

  def getPageSize = {
    content.length
  }

  def getLinkCount = {
    "<a[ >]".r.findAllIn(content).length
  }
}

val urls = List("http://www.twitter.com/", "http://www.nytimes.com/", "http://www.reddit.com/", "http://www.digg.com/")

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
  for(url <- urls) {
    val pl = new PageLoader(url)
    println("Size, Link Count for " + url + ": " + pl.getPageSize + ", " + pl.getLinkCount)
  }
}

def getPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    val pl = new PageLoader(url)
    actor { caller !  (url, pl.getPageSize, pl.getLinkCount) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, size, count) => println("Size, Link Count for " + url + ": " + size + ", " + count)
    }
  }
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }
println("Concurrent run:")
timeMethod { getPageSizeConcurrently }
