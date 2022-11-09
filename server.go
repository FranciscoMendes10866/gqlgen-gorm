package main

import (
	"github.com/AndriyKalashnykov/gqlgen-gorm/graph/generated"
	resolvers "github.com/AndriyKalashnykov/gqlgen-gorm/graph/resolvers"
	common2 "github.com/AndriyKalashnykov/gqlgen-gorm/internal/common"
	"log"
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
)

const defaultPort = "4000"

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}

	db, err := common2.InitDb()
	if err != nil {
		log.Fatal(err)
	}

	srv := handler.NewDefaultServer(generated.NewExecutableSchema(generated.Config{Resolvers: &resolvers.Resolver{}}))

	customCtx := &common2.CustomContext{
		Database: db,
	}

	http.Handle("/", playground.Handler("GraphQL playground", "/query"))
	http.Handle("/query", common2.CreateContext(customCtx, srv))

	log.Printf("connect to http://localhost:%s/ for GraphQL playground", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
