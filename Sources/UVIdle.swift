import CUV

public class UVIdle {
	init(loop: UVLoop) {
		uvIdle = uv_idle_t()
		uv_idle_init(loop.uvLoop(), &uvIdle)
		uvIdle.data = UnsafeMutablePointer(Unmanaged.passUnretained(self).toOpaque())
	}

	public func start(callback: UVIdleCallback) {
		selfRef = self
		self.callback = callback
		uv_idle_start(&uvIdle) { (uvi) in
			let that = Unmanaged<UVIdle>.fromOpaque(COpaquePointer(uvi.memory.data)).takeUnretainedValue()
			that.callback!(that)
		}
	}

	public func stop() {
		uv_idle_stop(&uvIdle)
		self.callback = nil
		selfRef = nil
	}

	var selfRef: UVIdle?
	var callback: UVIdleCallback?
	var uvIdle: uv_idle_t
}