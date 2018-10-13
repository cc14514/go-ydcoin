package main

import (
	"encoding/hex"
	"github.com/cc14514/go-ydcoin/crypto"
	"fmt"
	"github.com/cc14514/go-ydcoin/accounts/keystore"
)

func main() {

	prv, _ := crypto.GenerateKey()

	j := `{"address":"f91cb4a4615edc7d3b30b6abfa9c105c93050cca","crypto":{"cipher":"aes-128-ctr","ciphertext":"68ce3c60a1106c2941607f607b542b6c51b9a3a5f05b300ed8ed9f101eb17edf","cipherparams":{"iv":"6b4d85bb747809df0f3483748a9c07f8"},"kdf":"scrypt","kdfparams":{"dklen":32,"n":262144,"p":1,"r":8,"salt":"10288678881cb3de466d755207d1b95df36c919e66e7b3aed8493e749f3ad275"},"mac":"e756fd55e4d1dd8a14dee3e3b29298cdcbb88f3447c7165c1b2b52e7619d0dbf"},"id":"00179833-fc32-42eb-a35f-99a86034f978","version":3}`
	fmt.Println(j)
	if k, err := keystore.DecryptKey([]byte(j), "123456"); err != nil {
		fmt.Println(err)
	} else {
		prv = k.PrivateKey
	}

	buf := crypto.FromECDSA(prv)
	s := hex.EncodeToString(buf)
	fmt.Println("privatekey:", s)
	fmt.Println("address:", crypto.PubkeyToAddress(prv.PublicKey).Hex())
}
