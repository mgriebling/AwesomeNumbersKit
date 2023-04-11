//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

#if !DEBUG

import ANKFoundation
import ANKFullWidthKit
import XCTest

private typealias X = ANK192X64
private typealias Y = ANK192X32

//*============================================================================*
// MARK: * Int192 x Bitwise
//*============================================================================*

final class Int192BenchmarksOnBitwise: XCTestCase {
    
    typealias T = ANKInt192
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testAnd() {
        var lhs = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        var rhs = _blackHoleIdentity(T(x64: X( 0,  1,  2)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(lhs & rhs)
            _blackHoleInoutIdentity(&lhs)
            _blackHoleInoutIdentity(&rhs)
        }
    }
    
    func testOr() {
        var lhs = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        var rhs = _blackHoleIdentity(T(x64: X( 0,  1,  2)))

        for _ in 0 ..< 1_000_000 {
            _blackHole(lhs | rhs)
            _blackHoleInoutIdentity(&lhs)
            _blackHoleInoutIdentity(&rhs)
        }
    }
    
    func testXor() {
        var lhs = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        var rhs = _blackHoleIdentity(T(x64: X( 0,  1,  2)))

        for _ in 0 ..< 1_000_000 {
            _blackHole(lhs ^ rhs)
            _blackHoleInoutIdentity(&lhs)
            _blackHoleInoutIdentity(&rhs)
        }
    }
    
    func testNot() {
        var abc = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(~abc)
            _blackHoleInoutIdentity(&abc)
        }
    }
    
    func testByteSwapped() {
        var abc = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.byteSwapped)
            _blackHoleInoutIdentity(&abc)
        }
    }
}

//*============================================================================*
// MARK: * UInt192 x Bitwise
//*============================================================================*

final class UInt192BenchmarksOnBitwise: XCTestCase {
    
    typealias T = ANKUInt192
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testAnd() {
        var lhs = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        var rhs = _blackHoleIdentity(T(x64: X( 0,  1,  2)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(lhs & rhs)
            _blackHoleInoutIdentity(&lhs)
            _blackHoleInoutIdentity(&rhs)
        }
    }
    
    func testOr() {
        var lhs = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        var rhs = _blackHoleIdentity(T(x64: X( 0,  1,  2)))

        for _ in 0 ..< 1_000_000 {
            _blackHole(lhs | rhs)
            _blackHoleInoutIdentity(&lhs)
            _blackHoleInoutIdentity(&rhs)
        }
    }
    
    func testXor() {
        var lhs = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        var rhs = _blackHoleIdentity(T(x64: X( 0,  1,  2)))

        for _ in 0 ..< 1_000_000 {
            _blackHole(lhs ^ rhs)
            _blackHoleInoutIdentity(&lhs)
            _blackHoleInoutIdentity(&rhs)
        }
    }
    
    func testNot() {
        var abc = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(~abc)
            _blackHoleInoutIdentity(&abc)
        }
    }
    
    func testByteSwapped() {
        var abc = _blackHoleIdentity(T(x64: X(~0, ~1, ~2)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.byteSwapped)
            _blackHoleInoutIdentity(&abc)
        }
    }
}

#endif
