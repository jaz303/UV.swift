import CUV

public typealias UVRunMode = uv_run_mode

// TODO: uv_loop_configure()
// TODO: uv_loop_close()
// TODO: uv_walk()
public class UVLoop {
	public init() {
		_fLoopPtr = UnsafeMutablePointer<uv_loop_t>.alloc(1)
		uv_loop_init(_fLoopPtr)
	}

	deinit {
		// TODO: stop, close, what?
		_fLoopPtr.dealloc(1)
	}

	public var alive : Bool {
		get { return uv_loop_alive(_fLoopPtr) != 0 }
	}

	public var now : UInt64 {
		get { return uv_now(_fLoopPtr) }
	}

	// public func configure() {
	// 
	// }

	public func run(mode mode: UVRunMode = UV_RUN_DEFAULT) {
		uv_run(_fLoopPtr, mode)
	}

	// public func close() {
	// 	uv_loop_close(&_fLoop)
	// }

	public func stop() {
		uv_stop(_fLoopPtr)
	}

	public func uvLoop() -> UnsafeMutablePointer<uv_loop_t> {
		return _fLoopPtr
	}

	//
	//

	var _fLoopPtr: UnsafeMutablePointer<uv_loop_t>
}