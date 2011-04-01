# don't have random addon

in := File standardInput

range := list()
#for(i, 1, 100, range append(i))
#selection := range anyOne asString

i := 0
selection := "3"
guess := "0"

while(guess != selection and i < 10,
    "take a guess" println
    i := i + 1
    guess := in readLine)

if(guess == selection, "good job", "sorry, not fast enough") println
