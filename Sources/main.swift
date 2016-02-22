print("here we go!")

let loop = UVLoop.defaultLoop()

openFile(loop, "test.txt") {
	print("operation complete! boom time!")
}

loop.run()

