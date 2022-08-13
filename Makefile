# Build step (compile)
build:
	go build -o bin/main server.go

# Development step (file watch using "air")
dev:
	air server.go

# Run step (binary execution)
start:
	./bin/main