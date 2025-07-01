import Combine
import Foundation

/// An unsafe mutable array that can be accessed from multiple threads.
/// > Warning: Exposing any observable property externally (such as by having a computed property use `isEmpty`) will lead to very hard to debug crashes.
final class UnsafeMutableArray<T: Sendable>: ObservableObject, @unchecked Sendable {
    @Published private(set) var array = [T]()
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    var first: T? {
        array.first
    }
    
    func push(_ value: T) {
        array.append(value)
    }
    
    @discardableResult
    func popFirst() -> T? {
        let value = array.isEmpty ? nil : array.removeFirst()
        return value
    }
    
    func clear() {
        array.removeAll()
    }
}
