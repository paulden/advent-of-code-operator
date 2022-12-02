# Advent of Code Kubernetes Operator

Why not?

## TODO

- [X] Add Dockerfile
- [ ] Add Helm chart
- [ ] Add reconciliation logic if `Result` resource is removed
- [ ] Mark `Puzzle` as solved in status when solved
- [ ] Add events to `Puzzle` when error occurs
- [ ] Change `Result` `solved` attribute as `solvedAt`
- [ ] Clean up hard-coded `:dev` environment used in `AdventOfCode.Application`
- [ ] Add support for other years
- [ ] Add integration tests

## Workarounds

- I had to use the same image for both build and run images, otherwise I can't run my release due to the following error (even though `erlexec` does exist)

```
/app/releases/0.1.0/../../erts-13.1.2/bin/erl: exec: line 12: /app/erts-13.1.2/bin/erlexec: not found
```
