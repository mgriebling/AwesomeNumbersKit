//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * Aliases
//*============================================================================*

public typealias HL<H,L> = (high: H, low:  L)
public typealias LH<L,H> = (low:  L, high: H)
public typealias QR<Q,R> = (quotient: Q,  remainder: R)
public typealias PVO<PV> = (partialValue: PV, overflow: Bool)

//*============================================================================*
// MARK: * Aliases x Protocols
//*============================================================================*

public protocol WoRdS: RandomAccessCollection<UInt> where Index == Int { }
