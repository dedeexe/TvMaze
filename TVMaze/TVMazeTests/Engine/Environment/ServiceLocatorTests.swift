//
//  ServiceLocatorTests.swift
//  TVMazeTests
//
//  Created by dede.exe on 02/07/23.
//

@testable import TVMaze
import XCTest

final class ServiceLocatorTests: XCTestCase {

    var sut: ServiceLocator!

    override func setUpWithError() throws {
        sut = ServiceLocator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_register_whenResolve_shouldReturnClassInscante() {
        //Given
        sut.register(service: ClassA())
        sut.register(identifier: "SecondClass", service: { ClassB(value: 10) })

        //When
        let classA: ClassA? = sut.resolve()
        let classB: ClassB? = sut.resolve(identifier: "SecondClass")
        let classC: ClassB? = sut.resolve(identifier: "ThirdClass")

        //Then
        XCTAssertNotNil(classA)
        XCTAssertNotNil(classB)
        XCTAssertNil(classC)
    }

}

// MARK: - Helpers Object

private class ClassA {
    init() {}
}

private class ClassB {
    var value: Int

    init(value: Int) {
        self.value = value
    }
}
