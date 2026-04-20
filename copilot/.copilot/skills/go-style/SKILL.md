---
name: go-style
description: >
  MUST USE for ANY Go (.go) code. Writing, reading, reviewing, refactoring,
  debugging, testing Go files. Triggers: any .go file, go test, go build,
  Go module, Go package, Go interface, Go error handling.
---

# Go Style Guide

You are writing Go the way I write Go. Follow every rule below. When in doubt,
favour clarity over cleverness, simplicity over abstraction, and explicitness
over magic. When delegating Go work to subagents via `task()`, always include
"Follow the go-style skill" in the task prompt so the subagent picks it up.

---

## Core principles (in priority order)

1. **Clarity** – code is read far more than it is written. Optimise for the reader.
2. **Simplicity** – if the design isn't obviously correct, it's wrong.
3. **Productivity** – small surface area, fast feedback loops, easy-to-navigate code.

---

## Go Proverbs – treat these as law

- Don't communicate by sharing memory, share memory by communicating.
- Concurrency is not parallelism.
- Channels orchestrate; mutexes serialize.
- The bigger the interface, the weaker the abstraction.
- Make the zero value useful.
- `interface{}` says nothing (prefer concrete types or small, purpose-built interfaces).
- Gofmt's style is no one's favourite, yet gofmt is everyone's favourite.
- A little copying is better than a little dependency.
- Clear is better than clever.
- Reflection is never clear.
- Errors are values.
- Don't just check errors, handle them gracefully.
- Design the architecture, name the components, document the details.
- Documentation is for users.
- Don't panic.

---

## Control flow – the "left-hand path"

This is non-negotiable:

- **Never use `else`.** Handle the failure/edge case first, then `return` early.
  The happy path hugs the left margin so a reader can follow it with their eyes
  in a straight line from top to bottom.
- Guard clauses go first; the successful outcome is always the last thing in the
  function.

```go
// BAD
func process(r *Request) (*Result, error) {
    if r.Valid() {
        result, err := doWork(r)
        if err == nil {
            return result, nil
        } else {
            return nil, fmt.Errorf("doing work: %w", err)
        }
    } else {
        return nil, errors.New("invalid request")
    }
}

// GOOD
func process(r *Request) (*Result, error) {
    if !r.Valid() {
        return nil, errors.New("invalid request")
    }

    result, err := doWork(r)
    if err != nil {
        return nil, fmt.Errorf("doing work: %w", err)
    }

    return result, nil
}
```

---

## Error handling

- Always wrap errors with context using `fmt.Errorf("doing X: %w", err)`.
  The wrapping message should describe what the current function was trying to
  do, written in lowercase, without a trailing period.
- Prefer `errors.New` for sentinel errors. Make them constants when possible
  (Dave Cheney's "constant errors" pattern).
- Don't just `if err != nil { return err }`. Add context.
- Eliminate error handling by eliminating errors: design APIs so that invalid
  states are unrepresentable.

---

## Naming

Follow Dave Cheney's naming rules:

- **Variable length ∝ scope.** Single letters for tiny scopes (`i`, `p`, `r`),
  single words for parameters and returns, multi-word for package-level names.
- A variable's name describes its **contents**, not its type.
  `users` not `usersMap`. `count` not `countInt`.
- Don't let package names steal good variable names (e.g., use `ctx` not
  `context` for a `context.Context`).
- Package names: short, lowercase, singular nouns. No `util`, `base`, `common`,
  `helpers`, or `misc`.
- Method/interface names: single words when possible. Interfaces name the
  behaviour (`Reader`, `Stringer`), not the thing.

---

## Package design

- Keep the public API surface as small as possible. Use `internal/` packages
  aggressively to hide implementation.
- Avoid package-scoped variables (mutable global state). If you need
  configuration, accept it as a parameter or use functional options.
- Functional options (`func WithTimeout(d time.Duration) Option`) for friendly,
  extensible APIs.
- Don't force allocations on callers. Let them control memory.
- Be wary of functions which take several parameters of the same type — they are
  easy to mix up.

---

## Testing

- **Always TDD.** THIS IS NON NEGOTIABLE UNLESS EXPLICITLY TOLD SO. Write the test first, then make it pass, then refactor. Always.
- **Always use external test packages.** The test file for package `foo` uses
  `package foo_test`. This forces you to test through the public API, which:
  - Validates the API is actually pleasant to use.
  - Prevents coupling tests to internals.
  - Results in better package design.
- Prefer writing small manual mock implementations of interfaces over using a
  mocking framework, this encourages keeping interfaces small. If the
  project/package standard is to use a mocking framework, follow that.
- Prefer table-driven tests for anything with more than two cases.
- Test behaviour, not implementation.
- Use `testdata/` for fixtures. Use `testify` or standard `testing` — keep
  assertion helpers simple and readable.
- Benchmarks use `testing.B`, not wall-clock guessing.

```go
// Test file for package user lives in package user_test
package user_test

import (
    "testing"

    "example.com/myapp/user"
)

func TestCreate(t *testing.T) {
    // tests go here
}
```

---

## Things I never use (Mat Ryer's list)

Avoid these unless you have a very specific, justified reason:

- **`goto` and labels** – spaghetti code. If you need labeled breaks in nested
  loops, restructure your code instead. Labels break glanceability.
- **`else`** – already covered above. Flip the if-condition, return early, keep
  the happy path on the left.
- **`new()`** – never use `new(T)`. Always use `&T{}` for pointer allocation.
  The `&T{}` form is consistent whether you set fields or not, minimising diff
  noise when fields are added later.
- **`panic`** – prefer returning errors. The only acceptable panic is replacing a
  runtime panic (e.g. nil pointer) with a more descriptive message to help
  debugging.
- **Struct literals without field names** – always name the fields. Positional
  fields hide meaning (`Person{"Mat", 42}` – what is 42?). Named fields are
  self-documenting (`Person{Name: "Mat", Age: 42}`).
- **`http.Handler` interface** – prefer `http.HandlerFunc`. Use the closure
  pattern: a method on your server struct that returns `http.HandlerFunc`. This
  allows setup/preparation before returning the handler, and middlewares are
  just functions wrapping functions.
- **Method expressions** – never call `Greeter.Greet(g)` instead of `g.Greet()`.
  It's obscure syntax that confuses readers.
- **Arrays** – just use slices. Don't worry about arrays vs slices; use `var x
  []T` and `append`. Optimise capacity later only if benchmarks demand it, and
  even then avoid magic capacity numbers — use named constants with comments.
- **Named return values** – they confuse readers. Only acceptable for `defer`
  error annotation in rare cases.
- **`init()` functions** – they obscure program flow. Pass dependencies
  explicitly.
- **Blank imports** – only for driver registration (e.g., `database/sql`
  drivers); always comment why.
- **Reflection** – reflection is never clear. Use generics or code generation
  instead.
- **`any` / `interface{}` as lazy API design** – if you find yourself reaching
  for `any`, step back and design a proper type or interface.

## HTTP handlers (Mat Ryer's closure pattern)

Prefer `http.HandlerFunc` and the closure pattern for handlers:

```go
// The method lives on your server struct so it has access to dependencies.
// It returns http.HandlerFunc — setup happens before the return.
func (s *server) handleGreet() http.HandlerFunc {
    // Preparation runs once at route-registration time (or lazily with sync.Once).
    tmpl := template.Must(template.ParseFiles("greet.html"))

    return func(w http.ResponseWriter, r *http.Request) {
        // Handler logic here — tmpl is captured in the closure.
        tmpl.Execute(w, map[string]string{"name": r.URL.Query().Get("name")})
    }
}

// For expensive setup, use sync.Once for lazy initialisation:
func (s *server) handleExpensive() http.HandlerFunc {
    var (
        init sync.Once
        tmpl *template.Template
    )

    return func(w http.ResponseWriter, r *http.Request) {
        init.Do(func() {
            tmpl = template.Must(template.ParseFiles("expensive.html"))
        })
        tmpl.Execute(w, nil)
    }
}
```

Middleware is just a function that takes and returns `http.HandlerFunc`:

```go
func logging(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        log.Printf("%s %s", r.Method, r.URL.Path)
        next(w, r)
    }
}
```

---

## Struct initialisation

Always use `&T{}` (never `new`), and always name fields:

```go
// BAD
p := new(Person)
q := Person{"Mat", 42}

// GOOD
p := &Person{}
q := &Person{
    Name: "Mat",
    Age:  42,
}
```

The trailing comma after the last field is mandatory (Go enforces this when
fields are on separate lines) — it minimises diffs when adding or removing
fields.

---

- Never start a goroutine without knowing how it will stop.
- Prefer `context.Context` for cancellation and deadlines.
- Channels orchestrate; mutexes serialize. Pick the right tool.
- Keep concurrent code simple; if it's hard to reason about, redesign.

---

## Interfaces

- Accept interfaces, return structs.
- The bigger the interface, the weaker the abstraction. One or two methods max
  in most cases.
- Define interfaces at the point of use (the consumer), not at the point of
  implementation.
- Don't create interfaces preemptively "for testing". If you need a seam, the
  design will tell you.

---

## Comments and documentation

- `// Package foo does X.` — every exported package gets a doc comment.
- Every exported symbol gets a doc comment. The comment describes **what** and
  **why**, not **how**.
- Associative comments: if a comment is needed, place it near the code it
  explains. Don't write essay headers.
- If code needs a comment to explain what it does, consider rewriting the code
  instead.

---

## Miscellaneous

- `gofmt` everything, always. No exceptions. Use `gofumpt` if available.
- Use `go vet` and `staticcheck`. Fix all warnings.
- Prefer the standard library. A little copying is better than a little
  dependency.
- Make the zero value useful — design structs so that their zero value is
  ready-to-use or clearly invalid.
- Avoid global mutable state. Wire dependencies explicitly.
- If a function takes more than 3-4 parameters, consider a config struct or
  functional options.
