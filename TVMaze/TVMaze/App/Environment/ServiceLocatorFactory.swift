import Foundation

class ServiceLocatorFactory {
    private init() {
        // Private init
    }

    static let `default`: ServiceLocator = {
        return valid
    }()

    static let valid: ServiceLocator = {
        let serviceLocator = ServiceLocator()
        serviceLocator.register(service: ShowService())

        return serviceLocator
    }()


    static let mocked: ServiceLocator = {
        let serviceLocator = ServiceLocator()
        serviceLocator.register(service: ShowService())

        return serviceLocator
    }()
}

