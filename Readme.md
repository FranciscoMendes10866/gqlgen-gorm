# gqlgen-gorm
Golang + GraphQL + GORM

```bash
xdg-open http://localhost:4000/
```

### createTodo

```graphql
mutation createTodo {
    createTodo(text: "todo1") {
        id
        text
        done
    }
}
```

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

```graphql
query getTodo {
    getTodo(todoId: 1) {
        id
        text
        done
    }
}
```

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

### findTodos

```graphql
query findTodos {
    getTodos {
        id
        text
        done
    }
}
```

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

```graphql
mutation updateTodo {
    updateTodo(input: {id: 1, text: "todo", done: true}) {
        id
        text
        done
    }
}
```

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

```graphql
mutation deleteTodo {
    deleteTodo(todoId: 1) {
        id
        text
        done
    }
}
```

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