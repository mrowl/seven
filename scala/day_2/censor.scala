trait Censor {

  val replacements = scala.io.Source.fromFile("words.txt").getLines.map(_.split(":")).map(x => (x(0), x(1))).toMap

  def censor(para: String): String = {
    var sb = para
    for ((pattern, replacement) <- replacements) {
      sb = sb.replaceAll(pattern, replacement)
    }
    sb
  }
}

class CensoredParagraph(paragraph_init: String) extends Censor {

  val paragraph = censor(paragraph_init)

  def print() {
    println(paragraph)
  }
}

val me = new CensoredParagraph("What the darn shoot")
me.print()
