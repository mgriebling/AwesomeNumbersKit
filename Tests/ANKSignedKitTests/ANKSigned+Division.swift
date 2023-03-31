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
import ANKSignedKit
import XCTest

//*============================================================================*
// MARK: * ANK x Signed x Division
//*============================================================================*

final class ANKSignedTestsOnDivision: XCTestCase {
    
    typealias T = ANKSigned<UInt256>
    typealias D = ANKSigned<UInt>
    typealias M = UInt256
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testDividing() {
        XCTAssertEqual(T( 0) / T( 1),  0 as T)
        XCTAssertEqual(T( 0) / T( 2),  0 as T)
        XCTAssertEqual(T( 0) % T( 1),  0 as T)
        XCTAssertEqual(T( 0) % T( 2),  0 as T)
        
        XCTAssertEqual(T( 7) / T( 1),  7 as T)
        XCTAssertEqual(T( 7) / T( 2),  3 as T)
        XCTAssertEqual(T( 7) % T( 1),  0 as T)
        XCTAssertEqual(T( 7) % T( 2),  1 as T)
        
        XCTAssertEqual(T( 7) / T( 3),  2 as T)
        XCTAssertEqual(T( 7) / T(-3), -2 as T)
        XCTAssertEqual(T(-7) / T( 3), -2 as T)
        XCTAssertEqual(T(-7) / T(-3),  2 as T)
        
        XCTAssertEqual(T( 7) % T( 3),  1 as T)
        XCTAssertEqual(T( 7) % T(-3),  1 as T)
        XCTAssertEqual(T(-7) % T( 3), -1 as T)
        XCTAssertEqual(T(-7) % T(-3), -1 as T)
    }
    
    func testQuotientReportingOverflow() {
        XCTAssert(T.min.dividedReportingOverflow(by:  T(0)) == (T.min,  true) as (T, Bool))
        XCTAssert(T.min.dividedReportingOverflow(by: -T(1)) == (T.max, false) as (T, Bool))
    }

    func testRemainderReportingOverflow() {
        XCTAssert(T.min.remainderReportingOverflow(dividingBy:  T(0)) == (T.min,  true) as (T, Bool))
        XCTAssert(T.min.remainderReportingOverflow(dividingBy: -T(1)) == (T(  ), false) as (T, Bool))
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Digit
    //=------------------------------------------------------------------------=
    
    func testDividingByDigit() {
        XCTAssertEqual(T( 0) / D( 1),  0 as T)
        XCTAssertEqual(T( 0) / D( 2),  0 as T)
        XCTAssertEqual(T( 0) % D( 1),  0 as D)
        XCTAssertEqual(T( 0) % D( 2),  0 as D)

        XCTAssertEqual(T( 7) / D( 1),  7 as T)
        XCTAssertEqual(T( 7) / D( 2),  3 as T)
        XCTAssertEqual(T( 7) % D( 1),  0 as D)
        XCTAssertEqual(T( 7) % D( 2),  1 as D)
                
        XCTAssertEqual(T( 7) / D( 3),  2 as T)
        XCTAssertEqual(T( 7) / D(-3), -2 as T)
        XCTAssertEqual(T(-7) / D( 3), -2 as T)
        XCTAssertEqual(T(-7) / D(-3),  2 as T)
        
        XCTAssertEqual(T( 7) % D( 3),  1 as D)
        XCTAssertEqual(T( 7) % D(-3),  1 as D)
        XCTAssertEqual(T(-7) % D( 3), -1 as D)
        XCTAssertEqual(T(-7) % D(-3), -1 as D)
    }
    
    func testQuotientReportingOverflowDividingByDigit() {
        XCTAssert(T.min.dividedReportingOverflow(by:  D(0)) == (T.min,  true) as (T, Bool))
        XCTAssert(T.min.dividedReportingOverflow(by: -D(1)) == (T.max, false) as (T, Bool))
    }

    func testRemainderReportingOverflowDividingByDigit() {
        XCTAssert(T.min.remainderReportingOverflow(dividingBy:  D(0)) == (D(),  true) as (D, Bool))
        XCTAssert(T.min.remainderReportingOverflow(dividingBy: -D(1)) == (D(), false) as (D, Bool))
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Full Width
    //=------------------------------------------------------------------------=
    
    func testDividingFullWidth() {
        XCTAssert(T.max.dividingFullWidth(( T(1), M( 1))) == ( T(1),  T(2)) as (T, T))
        XCTAssert(T.max.dividingFullWidth((-T(1), M( 1))) == (-T(1), -T(2)) as (T, T))
        XCTAssert(T.min.dividingFullWidth(( T(1), M( 1))) == (-T(1),  T(2)) as (T, T))
        XCTAssert(T.min.dividingFullWidth((-T(1), M( 1))) == ( T(1), -T(2)) as (T, T))
        
        XCTAssert(T( 2).dividingFullWidth(( T(1), M( 1))) == (T.max/T(2) + T(1),  T(1)) as (T, T))
        XCTAssert(T( 2).dividingFullWidth((-T(1), M( 1))) == (T.min/T(2) - T(1), -T(1)) as (T, T))
        XCTAssert(T(-2).dividingFullWidth(( T(1), M( 1))) == (T.min/T(2) - T(1),  T(1)) as (T, T))
        XCTAssert(T(-2).dividingFullWidth((-T(1), M( 1))) == (T.max/T(2) + T(1), -T(1)) as (T, T))
    }
    
    func testDividingFullWidthTruncatesQuotient() {
        XCTAssert(T.max.dividingFullWidth((T.max, M.max)) == ( T(1),  T(0)) as (T, T))
        XCTAssert(T.max.dividingFullWidth((T.min, M.max)) == (-T(1),  T(0)) as (T, T))
        XCTAssert(T.min.dividingFullWidth((T.max, M.max)) == (-T(1),  T(0)) as (T, T))
        XCTAssert(T.min.dividingFullWidth((T.min, M.max)) == ( T(1),  T(0)) as (T, T))
        
        XCTAssert(T( 2).dividingFullWidth((T.max, M.max)) == (T.max,  T(1)) as (T, T))
        XCTAssert(T( 2).dividingFullWidth((T.min, M.max)) == (T.min, -T(1)) as (T, T))
        XCTAssert(T(-2).dividingFullWidth((T.max, M.max)) == (T.min,  T(1)) as (T, T))
        XCTAssert(T(-2).dividingFullWidth((T.min, M.max)) == (T.max, -T(1)) as (T, T))
        
        XCTAssert(T( 1).dividingFullWidth(( T(2), M( 3))) == ( T(3),  T(0)) as (T, T))
        XCTAssert(T( 1).dividingFullWidth((-T(2), M( 3))) == (-T(3), -T(0)) as (T, T))
        XCTAssert(T(-1).dividingFullWidth(( T(2), M( 3))) == (-T(3),  T(0)) as (T, T))
        XCTAssert(T(-1).dividingFullWidth((-T(2), M( 3))) == ( T(3), -T(0)) as (T, T))
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Miscellaneous
    //=------------------------------------------------------------------------=
    
    func testOverloadsAreUnambiguousWhereDigitIsSelf() {
        var x = D(1) as D.Digit
        
        XCTAssertNotNil(x /= D(1))
        XCTAssertNotNil(x %= D(2))
        XCTAssertNotNil(x.divideReportingOverflow(by: D(1)))
        XCTAssertNotNil(x.formRemainderReportingOverflow(dividingBy: D(2)))
        
        XCTAssertNotNil(x /  D(1))
        XCTAssertNotNil(x %  D(2))
        XCTAssertNotNil(x.dividedReportingOverflow(by: D(1)))
        XCTAssertNotNil(x.remainderReportingOverflow(dividingBy: D(2)))
        XCTAssertNotNil(x.quotientAndRemainder(dividingBy: D(1)))
        XCTAssertNotNil(x.dividingFullWidth((D(1), UInt(2))))
    }
    
    func testOverloadsAreUnambiguousWhenUsingIntegerLiterals() {
        var x = T(1)
        
        XCTAssertNotNil(x /= 1)
        XCTAssertNotNil(x %= 2)
        XCTAssertNotNil(x.divideReportingOverflow(by: 1))
        XCTAssertNotNil(x.formRemainderReportingOverflow(dividingBy: 2))
        
        XCTAssertNotNil(x /  1)
        XCTAssertNotNil(x %  2)
        XCTAssertNotNil(x.dividedReportingOverflow(by: 1))
        XCTAssertNotNil(x.remainderReportingOverflow(dividingBy: 2))
        XCTAssertNotNil(x.quotientAndRemainder(dividingBy: 1))
        XCTAssertNotNil(x.dividingFullWidth((1, 2)))
    }
}

#endif
