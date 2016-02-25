import CUV
import Foundation

// wrapping this in a struct to help type safety
public struct UVFile {
	public init(fd: Int32) {
		self.fd = fd
	}
	public let fd: uv_file
}

public typealias UVInt = Int32
public typealias UVSize = size_t
public typealias UVUID = UInt32
public typealias UVBuffer = uv_buf_t

public enum UVError : ErrorType {
	case TooManyArguments
	case PermissionDenied
	case AddressInUse
	case AddressNotAvailable
}

public typealias UVFSCallback = (UVError?) -> ()
public typealias UVFSFileCallback = (UVError?, UVFile?) -> ()
public typealias UVFSIntCallback = (UVError?, Int?) -> ()
public typealias UVFSStringCallback = (UVError?, String?) -> ()

// I don't understand why I need to prefix this with @objc...
@objc public protocol UVBufferConvertible {
	func asUVBuffer() -> UVBuffer
}

extension ByteBuffer : UVBufferConvertible {
	// ...nor this
	@objc public func asUVBuffer() -> UVBuffer {
		return UVBuffer(base: &self.data, len: self.length)
	}
}
