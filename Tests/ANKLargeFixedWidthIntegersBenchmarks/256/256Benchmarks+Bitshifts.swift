//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

#if !DEBUG

import ANKLargeFixedWidthIntegers
import XCTest

//*============================================================================*
// MARK: * Int256 x Benchmarks x Bitshifts
//*============================================================================*

final class Int256BenchmarksOnBitshifts: XCTestCase {
    
    typealias T = ANKInt256
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Bitshifts
    //=------------------------------------------------------------------------=
    
    func testBitshiftingLeft() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2

        for _ in 0 ..< 1_000_000 {
            _ = lhs << rhs
        }
    }
    
    func testBitshiftingRight() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2

        for _ in 0 ..< 1_000_000 {
            _ = lhs >> rhs
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Bitrotations
    //=------------------------------------------------------------------------=
    
    func testBitrotatingLeft() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2

        for _ in 0 ..< 1_000_000 {
            _ = lhs &<< rhs
        }
    }
    
    func testBitrotatingRight() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2
                
        for _ in 0 ..< 1_000_000 {
            _ = lhs &>> rhs
        }
    }
}

//*============================================================================*
// MARK: * UInt256 x Benchmarks x Bitshifts
//*============================================================================*

final class UInt256BenchmarksOnBitshifts: XCTestCase {
    
    typealias T = ANKUInt256
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Bitshifts
    //=------------------------------------------------------------------------=
    
    func testBitshiftingLeft() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2

        for _ in 0 ..< 1_000_000 {
            _ = lhs << rhs
        }
    }
    
    func testBitshiftingRight() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2

        for _ in 0 ..< 1_000_000 {
            _ = lhs >> rhs
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Bitrotations
    //=------------------------------------------------------------------------=
    
    func testBitrotatingLeft() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2

        for _ in 0 ..< 1_000_000 {
            _ = lhs &<< rhs
        }
    }
    
    func testBitrotatingRight() {
        let lhs = T(x64:(~0, ~1, ~2, ~3))
        let rhs = UInt.bitWidth * 3/2
                
        for _ in 0 ..< 1_000_000 {
            _ = lhs &>> rhs
        }
    }
}

#endif
