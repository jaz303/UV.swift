import CUV

typealias UVFSPtr = UnsafeMutablePointer<uv_fs_t>
public typealias UVFSCallback = () -> ()

public func openFile(loop: UVLoop, _ path: String, flags: Int32 = 0, mode: Int32 = 0, callback: UVFSCallback? = nil) {
	let req = UVFSPtr.alloc(1)
	stashCallback(req, callback)
	uv_fs_open(loop.uvLoop(), req, path, flags, mode) { (req: UVFSPtr) in
		let callback = unstashCallback(req)
		req.dealloc(1)
		callback?()
	}
}

func stashCallback(req: UVFSPtr, _ callback: UVFSCallback?) {
	if callback == nil {
		req.memory.data = nil
	} else {
		req.memory.data = UnsafeMutablePointer(
			Unmanaged.passRetained(
				Box<UVFSCallback>(callback!)
			).toOpaque()
		)
	}
}

func unstashCallback(req: UVFSPtr) -> UVFSCallback? {
	if req.memory.data == nil {
		return nil
	} else {
		let box: Box<UVFSCallback> = Unmanaged.fromOpaque(COpaquePointer(req.memory.data)).takeRetainedValue()
		return box.value
	}
}

class Box<T> {
	let value: T
	init(_ v: T) { value = v}
}