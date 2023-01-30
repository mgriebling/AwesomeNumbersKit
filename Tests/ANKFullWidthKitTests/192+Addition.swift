//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

#if DEBUG

import ANKFullWidthKit
import XCTest

//*============================================================================*
// MARK: * Int192 x Addition
//*============================================================================*

final class Int192TestsOnAddition: XCTestCase {
    
    typealias T = ANKInt192
    
    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=
    
    let a = UInt  .max
    let b = UInt64.max
    let c = UInt32.max
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testAdding() {
        XCTAssertEqual(T( 1) + T(-2), T(-1))
        XCTAssertEqual(T( 1) + T(-1), T( 0))
        XCTAssertEqual(T( 1) + T( 0), T( 1))
        XCTAssertEqual(T( 1) + T( 1), T( 2))
        XCTAssertEqual(T( 1) + T( 2), T( 3))
        
        XCTAssertEqual(T( 0) + T(-2), T(-2))
        XCTAssertEqual(T( 0) + T(-1), T(-1))
        XCTAssertEqual(T( 0) + T( 0), T( 0))
        XCTAssertEqual(T( 0) + T( 1), T( 1))
        XCTAssertEqual(T( 0) + T( 2), T( 2))

        XCTAssertEqual(T(-1) + T(-2), T(-3))
        XCTAssertEqual(T(-1) + T(-1), T(-2))
        XCTAssertEqual(T(-1) + T( 0), T(-1))
        XCTAssertEqual(T(-1) + T( 1), T( 0))
        XCTAssertEqual(T(-1) + T( 2), T( 1))
        
        XCTAssertEqual(T(x64:(b, b, 0)) +  T(x64:(3, 0, 0)), T(x64:( 2,  0,  1)))
        XCTAssertEqual(T(x64:(b, b, 0)) +  T(x64:(0, 3, 0)), T(x64:( b,  2,  1)))
        XCTAssertEqual(T(x64:(b, b, 0)) +  T(x64:(0, 0, 3)), T(x64:( b,  b,  3)))
        
        XCTAssertEqual(T(x64:(b, b, 0)) + -T(x64:(3, 0, 0)), T(x64:(~3,  b,  0)))
        XCTAssertEqual(T(x64:(b, b, 0)) + -T(x64:(0, 3, 0)), T(x64:( b, ~3,  0)))
        XCTAssertEqual(T(x64:(b, b, 0)) + -T(x64:(0, 0, 3)), T(x64:( b,  b, ~2)))
        
        XCTAssertEqual(T(x64:(0, 0, b)) +  T(x64:(3, 0, 0)), T(x64:( 3,  0,  b)))
        XCTAssertEqual(T(x64:(0, 0, b)) +  T(x64:(0, 3, 0)), T(x64:( 0,  3,  b)))
        XCTAssertEqual(T(x64:(0, 0, b)) +  T(x64:(0, 0, 3)), T(x64:( 0,  0,  2)))
        
        XCTAssertEqual(T(x64:(0, 0, b)) + -T(x64:(3, 0, 0)), T(x64:(~2,  b, ~1)))
        XCTAssertEqual(T(x64:(0, 0, b)) + -T(x64:(0, 3, 0)), T(x64:( 0, ~2, ~1)))
        XCTAssertEqual(T(x64:(0, 0, b)) + -T(x64:(0, 0, 3)), T(x64:( 0,  0, ~3)))
    }
    
    func testAddingWrappingAround() {
        XCTAssertEqual(T.min &+ T( 1), T.min + T(1))
        XCTAssertEqual(T.max &+ T( 1), T.min)

        XCTAssertEqual(T.min &+ T(-1), T.max)
        XCTAssertEqual(T.max &+ T(-1), T.max - T(1))
    }
    
    func testAddingReportingOverflow() {
        XCTAssert(T.min.addingReportingOverflow(T( 1)) == (T.min + 1, false) as (T, Bool))
        XCTAssert(T.max.addingReportingOverflow(T( 1)) == (T.min,     true ) as (T, Bool))

        XCTAssert(T.min.addingReportingOverflow(T(-1)) == (T.max,     true ) as (T, Bool))
        XCTAssert(T.max.addingReportingOverflow(T(-1)) == (T.max - 1, false) as (T, Bool))
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Int
    //=------------------------------------------------------------------------=
    
    func testAddingInt() {
        XCTAssertEqual(T( 1) + Int(-2), T(-1))
        XCTAssertEqual(T( 1) + Int(-1), T( 0))
        XCTAssertEqual(T( 1) + Int( 0), T( 1))
        XCTAssertEqual(T( 1) + Int( 1), T( 2))
        XCTAssertEqual(T( 1) + Int( 2), T( 3))
        
        XCTAssertEqual(T( 0) + Int(-2), T(-2))
        XCTAssertEqual(T( 0) + Int(-1), T(-1))
        XCTAssertEqual(T( 0) + Int( 0), T( 0))
        XCTAssertEqual(T( 0) + Int( 1), T( 1))
        XCTAssertEqual(T( 0) + Int( 2), T( 2))

        XCTAssertEqual(T(-1) + Int(-2), T(-3))
        XCTAssertEqual(T(-1) + Int(-1), T(-2))
        XCTAssertEqual(T(-1) + Int( 0), T(-1))
        XCTAssertEqual(T(-1) + Int( 1), T( 0))
        XCTAssertEqual(T(-1) + Int( 2), T( 1))
        
        XCTAssertEqual(T(x64:(b, b, 0)) +  Int(3), T(x64:( 2,  0,   1)))
        XCTAssertEqual(T(x64:(b, b, 0)) + -Int(3), T(x64:(~3,  b,   0)))
        XCTAssertEqual(T(x64:(0, 0, b)) +  Int(3), T(x64:( 3,  0,   b)))
        XCTAssertEqual(T(x64:(0, 0, b)) + -Int(3), T(x64:(~2,  b,  ~1)))
    }
    
    func testAddingIntWrappingAround() {
        XCTAssertEqual(T.min &+ Int( 1), T.min + T(1))
        XCTAssertEqual(T.max &+ Int( 1), T.min)

        XCTAssertEqual(T.min &+ Int(-1), T.max)
        XCTAssertEqual(T.max &+ Int(-1), T.max - T(1))
    }
    
    func testAddingIntReportingOverflow() {
        XCTAssert(T.min.addingReportingOverflow(Int( 1)) == (T.min + 1, false) as (T, Bool))
        XCTAssert(T.max.addingReportingOverflow(Int( 1)) == (T.min,     true ) as (T, Bool))

        XCTAssert(T.min.addingReportingOverflow(Int(-1)) == (T.max,     true ) as (T, Bool))
        XCTAssert(T.max.addingReportingOverflow(Int(-1)) == (T.max - 1, false) as (T, Bool))
    }
}

//*============================================================================*
// MARK: * UInt192 x Addition
//*============================================================================*

final class UInt192TestsOnAddition: XCTestCase {

    typealias T = ANKUInt192

    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=

    let a = UInt  .max
    let b = UInt64.max
    let c = UInt32.max
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=

    func testAdding() {
        XCTAssertEqual(T(0) + T(0), T(0))
        XCTAssertEqual(T(0) + T(1), T(1))
        XCTAssertEqual(T(0) + T(2), T(2))

        XCTAssertEqual(T(1) + T(0), T(1))
        XCTAssertEqual(T(1) + T(1), T(2))
        XCTAssertEqual(T(1) + T(2), T(3))

        XCTAssertEqual(T(x64:(b, b, 0)) + T(x64:(3, 0, 0)), T(x64:(2, 0, 1)))
        XCTAssertEqual(T(x64:(b, b, 0)) + T(x64:(0, 3, 0)), T(x64:(b, 2, 1)))
        XCTAssertEqual(T(x64:(b, b, 0)) + T(x64:(0, 0, 3)), T(x64:(b, b, 3)))
    }

    func testAddingWrappingAround() {
        XCTAssertEqual(T.min &+ T(1), T.min + T(1))
        XCTAssertEqual(T.max &+ T(1), T.min)
    }

    func testAddingReportingOverflow() {
        XCTAssert(T.min.addingReportingOverflow(T(1)) == (T.min + (1 as UInt), false) as (T, Bool))
        XCTAssert(T.max.addingReportingOverflow(T(1)) == (T.min,               true ) as (T, Bool))
    }

    //=------------------------------------------------------------------------=
    // MARK: Tests x UInt
    //=------------------------------------------------------------------------=

    func testAddingUInt() {
        XCTAssertEqual(T(0) + UInt(0), T(0))
        XCTAssertEqual(T(0) + UInt(1), T(1))
        XCTAssertEqual(T(0) + UInt(2), T(2))

        XCTAssertEqual(T(1) + UInt(0), T(1))
        XCTAssertEqual(T(1) + UInt(1), T(2))
        XCTAssertEqual(T(1) + UInt(2), T(3))

        XCTAssertEqual(T(x64:(b, b, 0)) + UInt(3), T(x64:(2, 0, 1)))
        XCTAssertEqual(T(x64:(b, 0, 0)) + UInt(3), T(x64:(2, 1, 0)))
        XCTAssertEqual(T(x64:(0, 0, 0)) + UInt(3), T(x64:(3, 0, 0)))
    }

    func testAddingUIntWrappingAround() {
        XCTAssertEqual(T.min &+ UInt(1), T.min + T(1))
        XCTAssertEqual(T.max &+ UInt(1), T.min)
    }

    func testAddingUIntReportingOverflow() {
        XCTAssert(T.min.addingReportingOverflow(UInt(1)) == (T.min + (1 as UInt), false) as (T, Bool))
        XCTAssert(T.max.addingReportingOverflow(UInt(1)) == (T.min,               true ) as (T, Bool))
    }
}

#endif
