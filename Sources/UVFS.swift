import CUV

typealias UVFSPtr = UnsafeMutablePointer<uv_fs_t>
public typealias UVFSCallback = () -> ()

public func close(loop: UVLoop, _ file: UVFile, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_close(loop._fLoopPtr, req, file) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func open(loop: UVLoop, _ path: String, flags: UVInt = 0, mode: UVInt = 0, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_open(loop.uvLoop(), req, path, flags, mode) { (req: UVFSPtr) in
		endRequest(req)
	}
}

// fsRead

public func unlink(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_unlink(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
		endRequest(req)
	}
}

// fsWrite

public func mkdir(loop: UVLoop, _ path: String, mode: UVInt = 0, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_mkdir(loop._fLoopPtr, req, path, mode) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func mkdtemp(loop: UVLoop, _ tpl: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_mkdtemp(loop._fLoopPtr, req, tpl) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func rmdir(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_rmdir(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func scandir(loop: UVLoop, _ path: String, flags: UVInt = 0, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_scandir(loop._fLoopPtr, req, path, flags) { (req: UVFSPtr) in
		endRequest(req)
	}
}

// scandir_next

public func stat(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_stat(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func stat(loop: UVLoop, _ file: UVFile, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_fstat(loop._fLoopPtr, req, file) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func lstat(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_lstat(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func rename(loop: UVLoop, path: String, newPath: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_rename(loop._fLoopPtr, req, path, newPath) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func sync(loop: UVLoop, file: UVFile, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_fsync(loop._fLoopPtr, req, file) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func datasync(loop: UVLoop, file: UVFile, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_fdatasync(loop._fLoopPtr, req, file) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func truncate(loop: UVLoop, file: UVFile, offset: Int64, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_ftruncate(loop._fLoopPtr, req, file, offset) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func sendfile(loop: UVLoop, outFile: UVFile, inFile: UVFile, offset: Int64, length: UVSize, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_sendfile(loop._fLoopPtr, req, outFile, inFile, offset, length) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func access(loop: UVLoop, path: String, mode: UVInt, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_access(loop._fLoopPtr, req, path, mode) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func chmod(loop: UVLoop, path: String, mode: UVInt, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_chmod(loop._fLoopPtr, req, path, mode) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func chmod(loop: UVLoop, file: UVFile, mode: UVInt, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_fchmod(loop._fLoopPtr, req, file, mode) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func utime(loop: UVLoop, path: String, atime: Double, mtime: Double, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_utime(loop._fLoopPtr, req, path, atime, mtime) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func utime(loop: UVLoop, file: UVFile, atime: Double, mtime: Double, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_futime(loop._fLoopPtr, req, file, atime, mtime) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func link(loop: UVLoop, path: String, newPath: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_link(loop._fLoopPtr, req, path, newPath) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func symlink(loop: UVLoop, path: String, newPath: String, flags: UVInt = 0, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_symlink(loop._fLoopPtr, req, path, newPath, flags) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func readlink(loop: UVLoop, path: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_readlink(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
		endRequest(req)
	}
}

/*public func realpath(loop: UVLoop, path: String, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_realpath(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
		endRequest(req)
	}
}*/

public func chown(loop: UVLoop, path: String, uid: UVUID, gid: UVUID, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_chown(loop._fLoopPtr, req, path, uid, gid) { (req: UVFSPtr) in
		endRequest(req)
	}
}

public func chown(loop: UVLoop, file: UVFile, uid: UVUID, gid: UVUID, callback: UVFSCallback? = nil) {
	let req = beginRequest(callback)
	uv_fs_fchown(loop._fLoopPtr, req, file, uid, gid) { (req: UVFSPtr) in
		endRequest(req)
	}
}

func beginRequest(callback: UVFSCallback?) -> UVFSPtr {
	// TODO: pool request objects
	let req = UVFSPtr.alloc(1)
	if callback == nil {
		req.memory.data = nil
	} else {
		req.memory.data = UnsafeMutablePointer(
			Unmanaged.passRetained(
				Box<UVFSCallback>(callback!)
			).toOpaque()
		)
	}
	return req
}

func endRequest(req: UVFSPtr) {
	var callback: UVFSCallback? = nil
	if req.memory.data != nil {
		let box: Box<UVFSCallback> =
			Unmanaged
				.fromOpaque(COpaquePointer(req.memory.data))
				.takeRetainedValue()
		callback = box.value
	}
	uv_fs_req_cleanup(req)
	req.dealloc(1)
	callback?()
}

class Box<T> {
	let value: T
	init(_ v: T) { value = v}
}