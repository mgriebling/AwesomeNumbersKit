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
// MARK: * Int192 x Negation
//*============================================================================*

final class Int192BenchmarksOnNegation: XCTestCase {
    
    typealias T = ANKInt192
    
    //=------------------------------------------------------------------------=
    // MARK: Tests
    //=------------------------------------------------------------------------=
    
    func testNegated() {
        var abc = ANK.blackHoleIdentity(T(x64: X(0, 1, 2)))
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(-abc)
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
    
    func testNegatedReportingOverflow() {
        var abc = ANK.blackHoleIdentity(T(x64: X(0, 1, 2)))
        
        for _ in 0 ..< 1_000_000 {
            ANK.blackHole(abc.negatedReportingOverflow())
            ANK.blackHoleInoutIdentity(&abc)
        }
    }
}

#endif
