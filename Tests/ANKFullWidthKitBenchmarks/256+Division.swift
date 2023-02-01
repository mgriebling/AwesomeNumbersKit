//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

#if !DEBUG

import ANKFullWidthKit
import XCTest

private typealias X = ANK256X64
private typealias Y = ANK256X32

//*============================================================================*
// MARK: * Int256 x Division
//*============================================================================*

final class Int256BenchmarksOnDivision: XCTestCase {
    
    typealias T = ANKInt256
    typealias M = T.Magnitude
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testQuotientAndRemainder() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = T(x64: X( 0,  1,  2,  3))
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.quotientAndRemainder(dividingBy: rhs)
        }
    }
    
    func testQuotientReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = T(x64: X( 0,  1,  2,  3))
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.dividedReportingOverflow(by: rhs)
        }
    }
    
    func testRemainderReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = T(x64: X( 0,  1,  2,  3))
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.remainderReportingOverflow(dividingBy: rhs)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Digit
    //=------------------------------------------------------------------------=
    
    func testQuotientAndRemainderDividingByDigit() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = Int.max
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.quotientAndRemainder(dividingBy: rhs)
        }
    }
    
    func testQuotientDividingByDigitReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = Int.max

        for _ in 0 ..< 1_000_000 {
            _ = lhs.dividedReportingOverflow(by: rhs)
        }
    }
    
    func testRemainderDividingByDigitReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = Int.max

        for _ in 0 ..< 1_000_000 {
            _ = lhs.remainderReportingOverflow(dividingBy: rhs)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Full Width
    //=------------------------------------------------------------------------=
    
    func testDividingFullWidth() {
        let lhs = (T.max)
        let rhs = (T.max, M.max)
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.dividingFullWidth(rhs)
        }
    }
}

//*============================================================================*
// MARK: * UInt256 x Division
//*============================================================================*

final class UInt256BenchmarksOnDivision: XCTestCase {
    
    typealias T = ANKUInt256
    typealias M = T.Magnitude
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testQuotientAndRemainder() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = T(x64: X( 0,  1,  2,  3))
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.quotientAndRemainder(dividingBy: rhs)
        }
    }
    
    func testQuotientReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = T(x64: X( 0,  1,  2,  3))
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.dividedReportingOverflow(by: rhs)
        }
    }
    
    func testRemainderReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = T(x64: X( 0,  1,  2,  3))
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.remainderReportingOverflow(dividingBy: rhs)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Digit
    //=------------------------------------------------------------------------=
    
    func testQuotientAndRemainderDividingByDigit() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = UInt.max
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.quotientAndRemainder(dividingBy: rhs)
        }
    }
    
    func testQuotientDividingByDigitReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = UInt.max

        for _ in 0 ..< 1_000_000 {
            _ = lhs.dividedReportingOverflow(by: rhs)
        }
    }
    
    func testRemainderDividingByDigitReportingOverflow() {
        let lhs = T(x64: X(~0, ~1, ~2, ~3))
        let rhs = UInt.max

        for _ in 0 ..< 1_000_000 {
            _ = lhs.remainderReportingOverflow(dividingBy: rhs)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Full Width
    //=------------------------------------------------------------------------=
    
    func testDividingFullWidth() {
        let lhs = (T.max)
        let rhs = (T.max, M.max)
        
        for _ in 0 ..< 1_000_000 {
            _ = lhs.dividingFullWidth(rhs)
        }
    }
}

#endif
