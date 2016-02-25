public class ByteBuffer {
	public init(_ length: Int) {
		self.length = length
		self.data = Array<Int8>(count: length, repeatedValue: 0)
	}

	public let length: Int
	var data: Array<Int8>
}