public class ByteBuffer : CustomStringConvertible {
	public init(_ length: Int) {
		self.length = length
		self.data = Array<Int8>(count: length, repeatedValue: 0)
	}

	public var description: String {
		var out : String = "<ByteBuffer"
		for i in 0 ..< min(16, length) {
			out += " " + String(format:"%02X", data[i])
		}
		if length > 16 {
			out += " ..."
		}
		out += ">"
		return out
	}

	public let length: Int
	var data: Array<Int8>
}