public class uv {
	public static var defaultLoop: UVLoop {
		if _defaultLoop == nil {
			_defaultLoop = UVLoop()
		}
		return _defaultLoop!
	}

	static var _defaultLoop: UVLoop?
}