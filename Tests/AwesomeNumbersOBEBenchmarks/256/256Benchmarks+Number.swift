//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

#if !DEBUG

import AwesomeNumbersOBE
import XCTest

//*============================================================================*
// MARK: * Int256 x Benchmarks x Number
//*============================================================================*

final class Int256BenchmarksOnNumber: XCTestCase {
    
    typealias T = Int256
    typealias S = Int256
    typealias M = T.Magnitude
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Int
    //=------------------------------------------------------------------------=
    
    func testInt() {
        let abc = Int.max
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x UInt
    //=------------------------------------------------------------------------=
    
    func testUInt() {
        let abc = UInt.max
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Signitude
    //=------------------------------------------------------------------------=
    
    func testSignitude() {
        let abc = S(x64:(0, 1, 2, 3))
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Magnitude
    //=------------------------------------------------------------------------=
    
    func testMagnitude() {
        let abc = M(x64:(0, 1, 2, 3))
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x (U)Int64, Int64
    //=------------------------------------------------------------------------=
    
    func testInt64() {
        let abc = Int64.max

        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    func testUInt64() {
        let abc = UInt64.max

        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    func testFloat64() {
        let abc = Float64(UInt64.max)
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
        }
    }
}

//*============================================================================*
// MARK: * UInt256 x Benchmarks x Number
//*============================================================================*

final class UInt256BenchmarksOnNumber: XCTestCase {
    
    typealias T = UInt256
    typealias S =  Int256
    typealias M = T.Magnitude
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Int
    //=------------------------------------------------------------------------=
    
    func testInt() {
        let abc = Int.max
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x UInt
    //=------------------------------------------------------------------------=
    
    func testUInt() {
        let abc = UInt.max
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Signitude
    //=------------------------------------------------------------------------=
    
    func testSignitude() {
        let abc = S(x64:(0, 1, 2, 3))
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Magnitude
    //=------------------------------------------------------------------------=
    
    func testMagnitude() {
        let abc = M(x64:(0, 1, 2, 3))
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x (U)Int64, Int64
    //=------------------------------------------------------------------------=
    
    func testInt64() {
        let abc = Int64.max

        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    func testUInt64() {
        let abc = UInt64.max

        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
            _ = T(clamping: abc)
            _ = T(truncatingIfNeeded: abc)
        }
    }
    
    func testFloat64() {
        let abc = Float64(UInt64.max)
        
        for _ in 0 ..< 1_000_000 {
            _ = T(abc)
            _ = T(exactly:  abc)
        }
    }
}

#endif
