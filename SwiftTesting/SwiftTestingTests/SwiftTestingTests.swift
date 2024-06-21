//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import XCTest
@testable import SwiftTesting

final class SwiftTestingTests: XCTestCase {

    let math = MathematicFunctions()
    
    func testAddIntegerFunction() {
        let result = math.addIntegers(x: 5, y: 8)
        
        XCTAssertEqual(result, 13)
    }
    
    func testDivideIntegerFunction() {
        let result = math.divideIntegers(x: 10, y: 5)
        
        XCTAssertEqual(result, 2)
    }
    
    func testMultiplayNumbersFunction() {
        let result = math.multiplayNumbers(x: 2, y: 5)
        
        XCTAssertEqual(result, 10)
    }

}
