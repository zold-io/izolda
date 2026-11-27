//
//  izoldaTests.swift
//  izoldaTests
//
//  Created by be on 5/5/19.
//  Copyright © 2019 Zerocracy. All rights reserved.
//

import XCTest
@testable import izolda

class izoldaTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testSavesContextOnEnteringBackground() {
        class Spy: AppDelegate {
            var saves = 0
            override func saveContext() {
                self.saves += 1
            }
        }
        let spy = Spy()
        spy.applicationDidEnterBackground(UIApplication.shared)
        XCTAssertEqual(spy.saves, 1, "Context was not saved on entering background")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
