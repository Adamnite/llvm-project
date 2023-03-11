// WebAssemblyInstrAdamnite.td-WebAssembly Adamnite codegen support -*- tablegen -*-
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// WebAssembly Adamnite operand code-gen constructs.
///
//===----------------------------------------------------------------------===//

multiclass AdamniteOps<WebAssemblyRegClass rc, string B> {
// Contract address.
defm ADVM_CONTRACT_ADDR_A#B : I<(outs rc:$addr), (ins), (outs), (ins),
                                [(set rc:$addr, (int_wasm_advm_contract_address))],
                                "advm.contract.address\t$addr",
                                "advm.contract.address",
                                0xc1>;

// Caller address.
defm ADVM_CALLER_ADDR_A#B : I<(outs rc:$addr), (ins), (outs), (ins),
                              [(set rc:$addr, (int_wasm_advm_caller_address))],
                              "advm.caller.address\t$addr",
                              "advm.caller.address",
                              0xc3>;

// Block timestamp.
defm ADVM_BLOCK_TS_A#B : I<(outs rc:$ts), (ins), (outs), (ins),
                           [(set rc:$ts, (int_wasm_advm_block_ts))],
                           "advm.block.ts\t$ts",
                           "advm.block.ts",
                           0xc6>;

// Balances.
defm ADVM_BALANCES_A#B : I<(outs rc:$balance), (ins rc:$addr), (outs), (ins rc:$addr),
                           [(set rc:$balance, (int_wasm_advm_balances rc:$addr))],
                           "advm.balances\t$balance, $addr",
                           "advm.balances\t$addr",
                           0xc2>;
}

defm : AdamniteOps<I64, "64">;
