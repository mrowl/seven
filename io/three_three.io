OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
    )
  r
)

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1))
)



Builder := Object clone
Builder indent := "  "
Builder indents := list()

Builder forward := method(
    spaces := self indents join()
    self indents push(self indent)

    args := call message arguments
    firstArg := args at(0)
    if(firstArg asString containsSeq("curlyBrackets("),
        args removeFirst
        attr_list := list()
        doString(firstArg asString) foreach(k, v,
            attr_list append(list(k, list("\"", v, "\"") join()) join("="))
        )
        attrs := list(" ", attr_list join(" ")) join(),
        attrs := "")

    writeln(spaces, "<", call message name, attrs, ">")
    args foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(spaces, self indent, content)))

    self indents pop
    writeln(spaces, "</", call message name, ">"))

Builder ul(
    {"key_one" : "value_one", "what" : "now"},
    li("Io"),
    li({ "kah" : "lua" }, "Lua"),
    li("Javascript"))

