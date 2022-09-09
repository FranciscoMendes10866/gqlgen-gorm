GOFLAGS="-mod=mod"

clean:
	@rm -rf ./.bin/
	@sudo rm -rf vendor/
	@mkdir ./.bin/
	@rm -f dev.db

generate: clean
	@sudo rm -rf graph/customTypes
	@sudo rm -rf graph/generated
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go run github.com/99designs/gqlgen generate

test: generate
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go test -v ./...

run:
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go run server.go

build:
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go build -o ./.bin/server server.go

image: generate
	docker build -t graphql-golang .

get: clean
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go get .

deps:
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go install github.com/99designs/gqlgen@latest

upgrade: clean
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go get -u
	@export GO15VENDOREXPERIMENT=0; export GOFLAGS=$(GOFLAGS); go mod tidy

create-todo:
	curl -s -H "Content-Type: application/json" -d '{ "query": "mutation {createTodo(text:\"todo\"){id text done}}" }' http://localhost:4000/query | jq .

update-todo:
	curl -s -H "Content-Type: application/json" -d '{ "query": "mutation {updateTodo(input:{id:1,text:\"todo\",done:true}){id text done}}" }' http://localhost:4000/query | jq .

get-todos:
	curl -s -H "Content-Type: application/json" -d '{ "query": "{getTodos{id text done}}" }' http://localhost:4000/query | jq .

get-todo:
	curl -s -H "Content-Type: application/json" -d '{ "query": "{getTodo(todoId:1){id text done}}" }' http://localhost:4000/query | jq .

delete-todo:
	curl -s -H "Content-Type: application/json" -d '{ "query": "mutation {deleteTodo(todoId:1){id text done}}" }' http://localhost:4000/query | jq .
