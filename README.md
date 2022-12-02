# Advent of Code Kubernetes Operator

Why not?

## TODO

- [X] Add Dockerfile
- [X] Add Helm chart
- [ ] Add different config files for test / dev / prod
- [ ] Clean up hard-coded `:dev` / `:prod` environment used in `AdventOfCode.Application`
- [ ] Check that `WATCH_NAMESPACES` variable is used properly
- [ ] Improve Helm chart (helpers and variabilize things that should be variabilized)
- [ ] Add reconciliation logic if `Result` resource is removed
- [ ] Mark `Puzzle` as solved in status when solved
- [ ] Add events to `Puzzle` when error occurs
- [ ] Change `Result` `solved` attribute as `solvedAt`
- [ ] Add support for other years
- [ ] Add integration tests

## Workarounds

- I had to use the same image for both build and run images, otherwise I can't run my release due to the following error (even though `erlexec` does exist)

```
/app/releases/0.1.0/../../erts-13.1.2/bin/erl: exec: line 12: /app/erts-13.1.2/bin/erlexec: not found
```

- I had to add `operator_name` and `group` parameters to the `bonny.exs` config, otherwise Bonny tries to call Mix to get these parameters.
