// Copyright 2017 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package core

// Constants containing the genesis allocation of built-in genesis blocks.
// Their content is an RLP-encoded list of (address, balance) tuples.
// Use mkalloc.go to create/update them.

// nolint: misspell
const (
	mainnetAllocData = "\xf8B\xe2\x94\xdb\u01f7td\xaa\xb8\xe7\x90R1\x88\xc5\xd6\xd1\xddNR\xf5\u3321\x8f\a\xd76\xb9\v\xe5P\x00\x00\x00\u0794\xf9\x1c\xb4\xa4a^\xdc};0\xb6\xab\xfa\x9c\x10\\\x93\x05\f\u0288\r\u0db3\xa7d\x00\x00"
	testnetAllocData = "\xf8B\xe2\x94\xdb\u01f7td\xaa\xb8\xe7\x90R1\x88\xc5\xd6\xd1\xddNR\xf5\u3321\x8f\a\xd76\xb9\v\xe5P\x00\x00\x00\u0794\xf9\x1c\xb4\xa4a^\xdc};0\xb6\xab\xfa\x9c\x10\\\x93\x05\f\u0288\r\u0db3\xa7d\x00\x00"
	rinkebyAllocData = "\xe4\xe3\x94,\x14\xca\xc6o\u82cf,\u02ef\xeb\xff\xc1A\x8eVe3e\x8d\f\x9f,\x9c\xd0Ft\xed\xea@\x00\x00\x00"
)

