import Dip
import Foundation

private let dip = DependencyContainer()

// MARK: - DI

public class DI {
    public static func resolve<T>(type: T.Type, tag: String? = nil) -> T {
        // swiftlint:disable force_try
        try! dip.resolve(tag: tag) as T
        // swiftlint:enable force_try
    }

    public static func resolve<T>(tag: String? = nil) -> T {
        // swiftlint:disable force_try
        try! dip.resolve(tag: tag) as T
        // swiftlint:enable force_try
    }

    public static func register<T>(scope: ComponentScope, type: T.Type, instance: T) {
        dip.register(scope) { instance }
    }

    public static func register<T>(scope: ComponentScope, type: T.Type, factory: () throws -> T ) {
        if let instance = try? factory() {
            dip.register(scope, type: T.self) { instance }
        } else {
            assertionFailure("instance")
        }
    }

    public static func register<InterfaceType>(_ factory: @escaping () -> InterfaceType ) {
        dip.register(factory: factory)
    }

    public static func register<T>(scope: ComponentScope, type: T.Type, tag: String, factory: () throws -> T ) {
        if let instance = try? factory() {
            dip.register(scope, type: T.self, tag: tag) { instance }
        } else {
            assertionFailure("instance")
        }
    }
}


// MARK: - Injected

@propertyWrapper
public struct Injected<Service> {

    // MARK: Lifecycle

    public init() {
    }

    // MARK: Public

    public var wrappedValue: Service {
        mutating get {
            lock.lock(); defer { lock.unlock() }
            if isEmpty {
                service = DI.resolve(type: Service.self)
            }
            return service
        }
        mutating set { service = newValue }
    }

    public var projectedValue: Injected<Service> {
        get { self }
        mutating set { self = newValue }
    }

    // MARK: Private

    private var service: Service!
    private let lock = NSLock()

    private var isEmpty: Bool { service == nil }

}
