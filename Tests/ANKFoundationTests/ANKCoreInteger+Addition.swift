//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

#if DEBUG

import ANKFoundation
import XCTest

//*============================================================================*
// MARK: * ANK x Core Integer x Addition
//*============================================================================*

final class ANKCoreIntegerTestsOnAddition: XCTestCase {
    
    typealias T = any ANKCoreInteger.Type
    
    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=
    
    let types: [T] = ANKCoreIntegerTests.types
    
    //=------------------------------------------------------------------------=
    // MARK: Tests x Miscellaneous
    //=------------------------------------------------------------------------=
    
    func testOverloadsAreUnambiguousWhenUsingIntegerLiterals() {
        func becauseThisCompilesSuccessfully(_ x: inout some ANKCoreInteger) {
            XCTAssertNotNil(x  += 0)
            XCTAssertNotNil(x &+= 0)
            XCTAssertNotNil(x.addReportingOverflow(0))
            
            XCTAssertNotNil(x  +  0)
            XCTAssertNotNil(x &+  0)
            XCTAssertNotNil(x.addingReportingOverflow(0))
        }
    }
}

#endif
