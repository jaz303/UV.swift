print("here we go!")

let loop = UVLoop.defaultLoop()

uv.open(loop, "test.txt") { (err, file) in
	let buffers = [ByteBuffer(16), ByteBuffer(16)]

	if err != nil {
		print("error opening file!")
		return
	}
	uv.read(loop, file!, buffers) { (err, bytesRead) in
		if err != nil {
			print("error reading from file!")
			return
		}
		print("read", bytesRead!, "bytes")
		print(buffers[0])
		print(buffers[1])
	}
}

loop.run()
