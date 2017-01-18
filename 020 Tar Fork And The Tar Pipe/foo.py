from os import fork, getpid, pipe, read, write

read_end, write_end = pipe()
child_pid = fork()

if child_pid:
# parent
    print "parent is about to read"
    data = read(read_end, 1000)
    print "parent read"
    print "data:", data
else:
# child
    print "child is about to write"
    write(write_end, "hello!")
    print "child wrote"
