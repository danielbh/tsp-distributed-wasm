
all: deps build

.PHONY: deps
deps:
	go get -d -v github.com/dustin/go-broadcast/...

.PHONY: build
build: deps
	go build -o ./tsp main.go rooms.go template.go && GOOS=js GOARCH=wasm go build -o dist/main.wasm wasm.go
