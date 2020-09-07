import XCTest
@testable import SwiftUIDebugUtil

final class SwiftUIDebugUtilTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftUIDebugUtil().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
