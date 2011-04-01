Builder := Object clone
Builder indent := "  "
Builder indents := list()

Builder forward := method(
    spaces := self indents join()
    self indents push(self indent)

    writeln(spaces, "<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(spaces, self indent, content)))

    self indents pop
    writeln(spaces, "</", call message name, ">"))

Builder ul(
    li("Io"),
    li("Lua"),
    li("Javascript"))

