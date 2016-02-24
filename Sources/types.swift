import CUV

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

public enum UVError : ErrorType {
	case TooManyArguments
	case PermissionDenied
	case AddressInUse
	case AddressNotAvailable
}

public typealias UVFSCallback = (UVError?) -> ()
public typealias UVFSFileCallback = (UVError?, UVFile?) -> ()
public typealias UVFSStringCallback = (UVError?, String?) -> ()
