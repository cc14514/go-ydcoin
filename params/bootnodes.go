// Copyright 2015 The go-ethereum Authors
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

package params

var MainnetBootnodes = []string{
	"enode://c89cf05dcd64d793bf0b38de2f119512b9b9f9e022b9d4795457876bfc29bd6635c089b7091b8a113764f781d462ca87252524b9a50e09a581b51e29dda988d3@101.251.230.213:50303",
	"enode://36dab75d2204159d5cb67dbcb87278a4bd78032bc8598e8d5f58aacdbbb81ffe673c5c18d59f23dcbef6f7855afcb3aca977c076e72134effa56d97d353f4170@101.251.230.213:50606",
	"enode://712b53c03c724650e985d6d799da248859791bff90b841b4ed08f7e187fcc64f5ebc106c3d5d086710882885991f1e2ab0128ac512ab62dc9f76d9174a15db61@101.251.230.212:50606",
}

var TestnetBootnodes = []string{
}

var RinkebyBootnodes = []string{
}

var RinkebyV5Bootnodes = []string{
}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{
}
