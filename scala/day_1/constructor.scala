class Person(first_name: String) {
  println("Outer constructor")
  def this(first_name: String, last_name: String) {
    this(first_name)
    println("inner constructor")
  }
  def talk() = println("hi")

}

val bob = new Person("Bob")
val bobTate = new Person("Bob", "Tate")
