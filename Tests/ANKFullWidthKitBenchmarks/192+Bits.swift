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
// MARK: * Int192 x Bits
//*============================================================================*

final class Int192BenchmarksOnBits: XCTestCase {
    
    typealias T = ANKInt192
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testNonzeroBitCount() {
        var abc = _blackHoleIdentity( T(x64: X(0, 0, 0)))
        var xyz = _blackHoleIdentity(~T(x64: X(0, 0, 0)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.nonzeroBitCount)
            _blackHole(xyz.nonzeroBitCount)
            
            _blackHoleInoutIdentity(&abc)
            _blackHoleInoutIdentity(&xyz)
        }
    }
    
    func testLeadingZeroBitCount() {
        var abc = _blackHoleIdentity( T(x64: X(0, 0, 0)))
        var xyz = _blackHoleIdentity(~T(x64: X(0, 0, 0)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.leadingZeroBitCount)
            _blackHole(xyz.leadingZeroBitCount)
            
            _blackHoleInoutIdentity(&abc)
            _blackHoleInoutIdentity(&xyz)
        }
    }
    
    func testTrailingZeroBitCount() {
        var abc = _blackHoleIdentity( T(x64: X(0, 0, 0)))
        var xyz = _blackHoleIdentity(~T(x64: X(0, 0, 0)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.trailingZeroBitCount)
            _blackHole(xyz.trailingZeroBitCount)
            
            _blackHoleInoutIdentity(&abc)
            _blackHoleInoutIdentity(&xyz)
        }
    }
}

//*============================================================================*
// MARK: * UInt192 x Bits
//*============================================================================*

final class UInt192BenchmarksOnBits: XCTestCase {
    
    typealias T = ANKUInt192
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testNonzeroBitCount() {
        var abc = _blackHoleIdentity( T(x64: X(0, 0, 0)))
        var xyz = _blackHoleIdentity(~T(x64: X(0, 0, 0)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.nonzeroBitCount)
            _blackHole(xyz.nonzeroBitCount)
            
            _blackHoleInoutIdentity(&abc)
            _blackHoleInoutIdentity(&xyz)
        }
    }
    
    func testLeadingZeroBitCount() {
        var abc = _blackHoleIdentity( T(x64: X(0, 0, 0)))
        var xyz = _blackHoleIdentity(~T(x64: X(0, 0, 0)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.leadingZeroBitCount)
            _blackHole(xyz.leadingZeroBitCount)
            
            _blackHoleInoutIdentity(&abc)
            _blackHoleInoutIdentity(&xyz)
        }
    }
    
    func testTrailingZeroBitCount() {
        var abc = _blackHoleIdentity( T(x64: X(0, 0, 0)))
        var xyz = _blackHoleIdentity(~T(x64: X(0, 0, 0)))
        
        for _ in 0 ..< 1_000_000 {
            _blackHole(abc.trailingZeroBitCount)
            _blackHole(xyz.trailingZeroBitCount)
            
            _blackHoleInoutIdentity(&abc)
            _blackHoleInoutIdentity(&xyz)
        }
    }
}

#endif
