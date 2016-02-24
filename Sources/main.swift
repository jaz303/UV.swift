print("here we go!")

let loop = UVLoop.defaultLoop()

unlink(loop, "test2.txt") { (err) in
	if err == nil {
		print("dleete!")
	} else {
		print("not deleted!")
	}
}

/*
open(loop, "test.txt") { (err,file) in
	if err == nil {
		print("OK!")
	} else {
		print("an error occurred!")
	}
}
*/

loop.run()

