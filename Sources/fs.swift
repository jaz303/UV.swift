import CUV

// TODO: read
// TODO: write
// TODO: stat
// TODO: lstat
// TODO: utime

// TODO: scandir
// TODO: scandir_next

typealias UVFSPtr = UnsafeMutablePointer<uv_fs_t>

extension uv {
	public static func close(loop: UVLoop, _ file: UVFile, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_close(loop._fLoopPtr, req, file.fd) { (req: UVFSPtr) in
			endReq(req)
		}
	}	

	public static func open(loop: UVLoop, _ path: String, flags: UVInt = 0, mode: UVInt = 0, callback: UVFSFileCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_open(loop.uvLoop(), req, path, flags, mode) { (req: UVFSPtr) in
			endFileReq(req)
		}
	}

	public static func read(loop: UVLoop, _ file: UVFile, _ buffer: UVBufferConvertible, offset: Int64 = -1, callback: UVFSIntCallback? = nil) {
		let req = beginReq(callback)
		var uvBuffer = buffer.asUVBuffer()
		uv_fs_read(loop.uvLoop(), req, file.fd, &uvBuffer, 1, offset) { (req: UVFSPtr) in
			endIntReq(req)
		}	
	}

	public static func read(loop: UVLoop, _ file: UVFile, _ buffers: [UVBuffer], offset: Int64 = -1, callback: UVFSIntCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_read(loop.uvLoop(), req, file.fd, buffers, UInt32(buffers.count), offset) { (req: UVFSPtr) in
			endIntReq(req)
		}
	}

	public static func read(loop: UVLoop, _ file: UVFile, _ buffers: [UVBufferConvertible], offset: Int64 = -1, callback: UVFSIntCallback? = nil) {
		let req = beginReq(callback)
		let uvBuffers = (buffers.map({$0.asUVBuffer()}))
		uv_fs_read(loop.uvLoop(), req, file.fd, uvBuffers, UInt32(buffers.count), offset) { (req: UVFSPtr) in
			endIntReq(req)
		}
	}

	public static func unlink(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_unlink(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func write(loop: UVLoop, _ file: UVFile, _ buffer: UVBufferConvertible, offset: Int64 = -1, callback: UVFSIntCallback? = nil) {
		let req = beginReq(callback)
		var uvBuffer = buffer.asUVBuffer()
		uv_fs_write(loop.uvLoop(), req, file.fd, &uvBuffer, 1, offset) { (req: UVFSPtr) in
			endIntReq(req)
		}	
	}

	public static func write(loop: UVLoop, _ file: UVFile, _ buffers: [UVBuffer], offset: Int64 = -1, callback: UVFSIntCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_write(loop.uvLoop(), req, file.fd, buffers, UInt32(buffers.count), offset) { (req: UVFSPtr) in
			endIntReq(req)
		}
	}

	public static func write(loop: UVLoop, _ file: UVFile, _ buffers: [UVBufferConvertible], offset: Int64 = -1, callback: UVFSIntCallback? = nil) {
		let req = beginReq(callback)
		let uvBuffers = (buffers.map({$0.asUVBuffer()}))
		uv_fs_write(loop.uvLoop(), req, file.fd, uvBuffers, UInt32(buffers.count), offset) { (req: UVFSPtr) in
			endIntReq(req)
		}
	}

	public static func mkdir(loop: UVLoop, _ path: String, mode: UVInt = 0, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_mkdir(loop._fLoopPtr, req, path, mode) { (req: UVFSPtr) in
			endFileReq(req)
		}
	}

	public static func mkdtemp(loop: UVLoop, _ tpl: String, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_mkdtemp(loop._fLoopPtr, req, tpl) { (req: UVFSPtr) in
			endStringReq(req)
		}
	}

	public static func rmdir(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_rmdir(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func scandir(loop: UVLoop, _ path: String, flags: UVInt = 0, callback: UVFSCallback? = nil) {
		let req = beginRequest(callback)
		uv_fs_scandir(loop._fLoopPtr, req, path, flags) { (req: UVFSPtr) in
			endRequest(req)
		}
	}

	// scandir_next

	public static func stat(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
		let req = beginRequest(callback)
		uv_fs_stat(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
			endRequest(req)
		}
	}

	public static func stat(loop: UVLoop, _ file: UVFile, callback: UVFSCallback? = nil) {
		let req = beginRequest(callback)
		uv_fs_fstat(loop._fLoopPtr, req, file.fd) { (req: UVFSPtr) in
			endRequest(req)
		}
	}

	public static func lstat(loop: UVLoop, _ path: String, callback: UVFSCallback? = nil) {
		let req = beginRequest(callback)
		uv_fs_lstat(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
			endRequest(req)
		}
	}

	public static func rename(loop: UVLoop, path: String, newPath: String, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_rename(loop._fLoopPtr, req, path, newPath) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func sync(loop: UVLoop, file: UVFile, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_fsync(loop._fLoopPtr, req, file.fd) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func datasync(loop: UVLoop, file: UVFile, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_fdatasync(loop._fLoopPtr, req, file.fd) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func truncate(loop: UVLoop, file: UVFile, offset: Int64, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_ftruncate(loop._fLoopPtr, req, file.fd, offset) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func sendfile(loop: UVLoop, outFile: UVFile, inFile: UVFile, offset: Int64, length: UVSize, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_sendfile(loop._fLoopPtr, req, outFile.fd, inFile.fd, offset, length) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func access(loop: UVLoop, path: String, mode: UVInt, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_access(loop._fLoopPtr, req, path, mode) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func chmod(loop: UVLoop, path: String, mode: UVInt, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_chmod(loop._fLoopPtr, req, path, mode) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func chmod(loop: UVLoop, file: UVFile, mode: UVInt, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_fchmod(loop._fLoopPtr, req, file.fd, mode) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func utime(loop: UVLoop, path: String, atime: Double, mtime: Double, callback: UVFSCallback? = nil) {
		let req = beginRequest(callback)
		uv_fs_utime(loop._fLoopPtr, req, path, atime, mtime) { (req: UVFSPtr) in
			endRequest(req)
		}
	}

	public static func utime(loop: UVLoop, file: UVFile, atime: Double, mtime: Double, callback: UVFSCallback? = nil) {
		let req = beginRequest(callback)
		uv_fs_futime(loop._fLoopPtr, req, file.fd, atime, mtime) { (req: UVFSPtr) in
			endRequest(req)
		}
	}

	public static func link(loop: UVLoop, path: String, newPath: String, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_link(loop._fLoopPtr, req, path, newPath) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func symlink(loop: UVLoop, path: String, newPath: String, flags: UVInt = 0, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_symlink(loop._fLoopPtr, req, path, newPath, flags) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func readlink(loop: UVLoop, path: String, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_readlink(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
			endStringReq(req)
		}
	}

	/*public static func realpath(loop: UVLoop, path: String, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_realpath(loop._fLoopPtr, req, path) { (req: UVFSPtr) in
			endStringReq(req)
		}
	}*/

	public static func chown(loop: UVLoop, path: String, uid: UVUID, gid: UVUID, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_chown(loop._fLoopPtr, req, path, uid, gid) { (req: UVFSPtr) in
			endReq(req)
		}
	}

	public static func chown(loop: UVLoop, file: UVFile, uid: UVUID, gid: UVUID, callback: UVFSCallback? = nil) {
		let req = beginReq(callback)
		uv_fs_fchown(loop._fLoopPtr, req, file.fd, uid, gid) { (req: UVFSPtr) in
			endReq(req)
		}
	}
}

//
//

func beginReq<T>(callback: T?) -> UVFSPtr {
	// TODO: pool request objects
	let req = UVFSPtr.alloc(1)
	if callback == nil {
		req.memory.data = nil
	} else {
		req.memory.data = UnsafeMutablePointer(
			Unmanaged.passRetained(Box<T>(callback!)).toOpaque()
		)
	}
	return req
}

func endReq(req: UVFSPtr) {
	let callback: UVFSCallback? = getCallback(req)
	if callback != nil {
		if req.memory.result < 0 {
			callback!(errorFromStatus(req.memory.result))
		} else {
			callback!(nil)
		}
	}
	cleanupReq(req)
}

func endFileReq(req: UVFSPtr) {
	let callback: UVFSFileCallback? = getCallback(req)
	if callback != nil {
		if req.memory.result < 0 {
			callback!(errorFromStatus(req.memory.result), nil)
		} else {
			callback!(nil, UVFile(fd: Int32(req.memory.result)))
		}
	}
	cleanupReq(req)
}

func endIntReq(req: UVFSPtr) {
	let callback: UVFSIntCallback? = getCallback(req)
	if callback != nil {
		if req.memory.result < 0 {
			callback!(errorFromStatus(req.memory.result), nil)
		} else {
			callback!(nil, req.memory.result)
		}
	}
	cleanupReq(req)
}

func endStringReq(req: UVFSPtr) {
	let callback: UVFSStringCallback? = getCallback(req)
	if callback != nil {
		if req.memory.result < 0 {
			callback!(errorFromStatus(req.memory.result), nil)
		} else {
			callback!(nil, String.fromCString(req.memory.path))
		}
	}
	cleanupReq(req)
}

func getCallback<T>(req: UVFSPtr) -> T? {
	if req.memory.data == nil {
		return nil
	} else {
		let box: Box<T> = Unmanaged
							.fromOpaque(COpaquePointer(req.memory.data))
							.takeRetainedValue()
		return box.value
	}
}

func cleanupReq(req: UVFSPtr) {
	uv_fs_req_cleanup(req)
	req.dealloc(1)
}

//
//

func beginRequest(callback: UVFSCallback?) -> UVFSPtr {
	return nil
}

func endRequest(req: UVFSPtr) {
	
}

func errorFromStatus(status: Int) -> UVError {
	return UVError.TooManyArguments
}

class Box<T> {
	let value: T
	init(_ v: T) { value = v; }
}