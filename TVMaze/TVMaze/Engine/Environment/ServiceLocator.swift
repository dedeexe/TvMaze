import Foundation

class ServiceLocator {
    private var services: [String: AnyObject] = [:]

    func register<T: AnyObject>(service: T) {
        let key = "\(type(of: service))"
        register(identifier: key, service: service)
    }

    func register<T: AnyObject>(identifier: String, service: T) {
        services[identifier] = service
    }

    func resolve<T: AnyObject>() -> T? {
        let key = String(describing: T.self)
        return resolve(identifier: key)
    }

    func resolve<T: AnyObject>(identifier: String) -> T? {
        services[identifier] as? T
    }
}

