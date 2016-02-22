import CUV

public typealias UVRunMode = uv_run_mode

// TODO: uv_loop_configure()
// TODO: uv_loop_close()
// TODO: uv_walk()
public class UVLoop {
	static var _defaultLoop: UVLoop?
	public static func defaultLoop() -> UVLoop {
		if _defaultLoop == nil {
			_defaultLoop = UVLoop()
		}
		return _defaultLoop!
	}

	public init() {
		_fLoop = uv_loop_t()
		uv_loop_init(&_fLoop)
	}

	public var alive : Bool {
		get { return uv_loop_alive(&_fLoop) != 0 }
	}

	public var now : UInt64 {
		get { return uv_now(&_fLoop) }
	}

	public func configure() {

	}

	public func run(mode mode: UVRunMode = UV_RUN_DEFAULT) {
		uv_run(&_fLoop, mode)
	}

	// public func close() {
	// 	uv_loop_close(&_fLoop)
	// }

	public func stop() {
		uv_stop(&_fLoop)
	}

	var _fLoop: uv_loop_t
}