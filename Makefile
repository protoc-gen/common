.PHONY: init
# init env
init:
	go mod tidy
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.36.3

.PHONY: common
# generate common
common:
	protoc --proto_path=./proto \
		   --go_out=paths=source_relative:./pkg/common \
		   ./proto/cnst/*.proto

.PHONY: all
# generate all
all:
	make common;
	go mod tidy;
