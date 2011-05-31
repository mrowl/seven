class Board(val board_line:String) {

  val players = List("X", "O")
  var flat = board_line.split(" ").toList
  var rows = List(List(""))
  var cols = List(List(""))
  var diags = List(List(""))

  build_matrices()

  def build_matrices() {
    rows = List.tabulate(3, 3) { (r: Int, c: Int) =>
      flat((r * 3) + c)
    }
    cols = List.tabulate(3, 3) { (r: Int, c: Int) =>
      flat((c * 3) + r)
    }
    diags = List(List(flat(2), flat(4), flat(6)), List(flat(0), flat(4), flat(8)))
  }
    
  def move(player: String, row: Int, col: Int) {
    assert (players.indexOf(player) >= 0)
    List(row, col).foreach( i => {
      if ((0 to 2).indexOf(i) == -1) {
        throw new IllegalArgumentException("Not valid talid placement: " + row.toString + "," + col.toString)
      }
    })
    val flat_index = (row * 3) + col
    if (flat(flat_index) == "_") {
      flat = flat.updated(flat_index, player)
      build_matrices()
    } else {
      throw new IllegalArgumentException("Illegal move: spot already taken")
    }
  }
    
  def status(): Int = {
    if (is_win("X")) {
      return 2
    } else if (is_win("O")) {
      return 3
    } else if (is_over()) {
      return 1
    } else {
      return 0
    }
  }

  def is_win(player:String): Boolean = {
    def check_series(initial:Boolean, series:List[String]): Boolean = {
      initial || (series.distinct.length == 1 && series(0) == player)
    }
    List(rows, cols, diags).foldLeft(false)((groups_stat: Boolean, group_mat: List[List[String]]) => {
        groups_stat || group_mat.foldLeft(false)(check_series)
    })
  }

  def is_over(): Boolean = (flat.indexOf("_") == -1)

  def print() {
    rows.foreach { row =>
      println(row.mkString(" "))
    }
  }
}

class Game() {

  var board = new Board("_ _ _ _ _ _ _ _ _")
  var cur_player = board.players.first

  def play() {
    println("Hey, " + cur_player + ", enter the row,column.")
    val line = readLine()
    val split = line.split(",") map (_.toInt)
    val row = split(0)
    val col = split(1)

    try {
      board.move(cur_player, row, col)
    } catch {
      case e:IllegalArgumentException => println(e.toString())
      play
    }
    println("")
    board.print()
    println("")
    
    val status = board.status
    if (status == 0) {
      next_player
      play
    } else if (status == 1) {
      println("\nIt's a tie!")
    } else if (status == 2) {
      println("\nX Won!")
    } else if (status == 3) {
      println("\nO Won!")
    }
  }

  def next_player() {
    if (cur_player == board.players.first) {
      cur_player = board.players.last
    } else {
      cur_player = board.players.first
    }
  }
}

val game = new Game()
game.play()
//val my_board = new Board("X O _ O X _ X _ O")
//my_board.print()
//my_board.status()
