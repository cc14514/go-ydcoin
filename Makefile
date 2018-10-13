# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: ydc android ios ydc-cross swarm evm all test clean
.PHONY: ydc-linux ydc-linux-386 ydc-linux-amd64 ydc-linux-mips64 ydc-linux-mips64le
.PHONY: ydc-linux-arm ydc-linux-arm-5 ydc-linux-arm-6 ydc-linux-arm-7 ydc-linux-arm64
.PHONY: ydc-darwin ydc-darwin-386 ydc-darwin-amd64
.PHONY: ydc-windows ydc-windows-386 ydc-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

ydc:
	build/env.sh go run build/ci.go install ./cmd/ydc
	@echo "Done building."
	@echo "Run \"$(GOBIN)/ydc\" to launch ydc."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/ydc.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Smc.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

ydc-cross: ydc-linux ydc-darwin ydc-windows ydc-android ydc-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/ydc-*

ydc-linux: ydc-linux-386 ydc-linux-amd64 ydc-linux-arm ydc-linux-mips64 ydc-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-*

ydc-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/ydc
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep 386

ydc-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/ydc
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep amd64

ydc-linux-arm: ydc-linux-arm-5 ydc-linux-arm-6 ydc-linux-arm-7 ydc-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep arm

ydc-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/ydc
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep arm-5

ydc-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/ydc
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep arm-6

ydc-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/ydc
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep arm-7

ydc-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/ydc
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep arm64

ydc-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/ydc
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep mips

ydc-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/ydc
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep mipsle

ydc-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/ydc
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep mips64

ydc-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/ydc
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/ydc-linux-* | grep mips64le

ydc-darwin: ydc-darwin-386 ydc-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/ydc-darwin-*

ydc-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/ydc
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-darwin-* | grep 386

ydc-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/ydc
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-darwin-* | grep amd64

ydc-windows: ydc-windows-386 ydc-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/ydc-windows-*

ydc-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/ydc
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-windows-* | grep 386

ydc-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/ydc
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/ydc-windows-* | grep amd64
