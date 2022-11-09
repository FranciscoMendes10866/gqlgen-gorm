# Golang + GraphQL + GORM (schema-first)

## Table Of Contents
- [GraphQL Server (schema-first) With Golang](#graphql-server-schema-first-with-golang)
    - [Table Of Contents](#table-of-contents)
        - [How to Run The Project <a name="how-to-run-project"></a>](#how-to-run-the-project-)
            - [createTodo](#createTodo)
            - [getTodo](#getTodo)
            - [findTodos](#findTodos)
            - [updateTodo](#updateTodo)
            - [deleteTodo](#deleteTodo)

### How to Run The Project <a name="how-to-run-project"></a>

Run the server:
```bash
make run
```

Navigate to https://localhost:4000 you can see GraphiQL playground and query the graphql server.

```bash
xdg-open http://localhost:4000/
```

### createTodo

Execute createTodo mutation

```bash
make create-todo
```

```graphql
mutation createTodo {
    createTodo(text: "todo1") {
        id
        text
        done
    }
}
```

Expected JSON result:

```json
{
  "data": {
    "createTodo": {
      "id": 1,
      "text": "todo1",
      "done": false
    }
  }
}
```

### getTodo

Execute getTodo query

```bash
make get-todo
```

```graphql
query getTodo {
    getTodo(todoId: 1) {
        id
        text
        done
    }
}
```

Expected JSON result:

```json
{
  "data": {
    "getTodo": {
      "id": 1,
      "text": "todo1",
      "done": false
    }
  }
}
```

### getTodos

Execute getTodos query

```bash
make get-todos
```

```graphql
query getTodos {
    getTodos {
        id
        text
        done
    }
}
```

Expected JSON result:

```json
{
  "data": {
    "getTodos": [
      {
        "id": 1,
        "text": "todo1",
        "done": false
      },
      {
        "id": 2,
        "text": "todo2",
        "done": false
      },
      {
        "id": 3,
        "text": "todo3",
        "done": false
      },
      {
        "id": 4,
        "text": "todo4",
        "done": false
      },
      {
        "id": 5,
        "text": "todo5",
        "done": false
      }
    ]
  }
}
```

### updateTodo

Execute updateTodo mutation

```bash
make update-todo
```

```graphql
mutation updateTodo {
    updateTodo(input: {id: 1, text: "todo", done: true}) {
        id
        text
        done
    }
}
```

Expected JSON result:

```json
{
  "data": {
    "updateTodo": {
      "id": 1,
      "text": "todo",
      "done": true
    }
  }
}
```

### deleteTodo

Execute deleteTodo mutation

```bash
make delete-todo
```

```graphql
mutation deleteTodo {
    deleteTodo(todoId: 1) {
        id
        text
        done
    }
}
```

Expected JSON result:

```json
{
  "data": {
    "deleteTodo": {
      "id": 0,
      "text": "",
      "done": false
    }
  }
}
```