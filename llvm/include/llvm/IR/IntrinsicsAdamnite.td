//===- IntrinsicsAdamnite.td - Defines Adamnite intrinsics --*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file defines all of the Adamnite-specific intrinsics.
///
//===----------------------------------------------------------------------===//

let TargetPrefix = "wasm" in {  // All intrinsics start with "llvm.wasm.".

// Query contract's address
def int_wasm_advm_contract_addr : Intrinsic<[llvm_ptr_ty], [], [IntrReadMem]>;

// Query caller's address
def int_wasm_advm_caller_addr : Intrinsic<[llvm_ptr_ty], [], [IntrReadMem]>;

// Query block's timestamp
def int_wasm_advm_block_ts : Intrinsic<[llvm_i64_ty], [], [IntrReadMem]>;

} // TargetPrefix = "wasm"
