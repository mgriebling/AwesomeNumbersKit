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

private typealias X = ANK256X64
private typealias Y = ANK256X32

//*============================================================================*
// MARK: * Int256 x Complements
//*============================================================================*

final class Int256BenchmarksOnComplements: XCTestCase {
    
    typealias T =  ANKInt256
    typealias M = ANKUInt256
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Bit Pattern
    //=------------------------------------------------------------------------=
    
    func testInitBitPattern() {
        var abc = ANK.blackHoleIdentity(M.max)
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(T(bitPattern: abc))
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
    
    func testValueAsBitPattern() {
        var abc = ANK.blackHoleIdentity(T.max)
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(abc.bitPattern)
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Magnitude
    //=------------------------------------------------------------------------=
    
    func testMagnitude() {
        var abc = ANK.blackHoleIdentity(T(x64: X(~0, ~1, ~2, ~3)))
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(abc.magnitude)
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Two's Complement
    //=------------------------------------------------------------------------=
    
    func testTwosComplement() {
        var abc = ANK.blackHoleIdentity(T(x64: X(~0, ~1, ~2, ~3)))
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(abc.twosComplement())
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
}

//*============================================================================*
// MARK: * UInt256 x Complements
//*============================================================================*

final class UInt256BenchmarksOnComplements: XCTestCase {
    
    typealias T = ANKUInt256
    typealias M = ANKUInt256
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Bit Pattern
    //=------------------------------------------------------------------------=
        
    func testInitBitPattern() {
        var abc = ANK.blackHoleIdentity(M.max)
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(T(bitPattern: abc))
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
    
    func testValueAsBitPattern() {
        var abc = ANK.blackHoleIdentity(T.max)
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(abc.bitPattern)
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Magnitude
    //=------------------------------------------------------------------------=
    
    func testMagnitude() {
        var abc = ANK.blackHoleIdentity(T(x64: X(~0, ~1, ~2, ~3)))
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(abc.magnitude)
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Two's Complement
    //=------------------------------------------------------------------------=
    
    func testTwosComplement() {
        var abc = ANK.blackHoleIdentity(T(x64: X(~0, ~1, ~2, ~3)))
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(abc.twosComplement())
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
}

#endif
