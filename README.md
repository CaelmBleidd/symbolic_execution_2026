# Символьное исполнение — 2026

Базовая инфраструктура курса: Go-модуль, обёртка над Z3, её тесты и пример работы с решателем.
Основана на инфраструктуре [первого коммита курса 2025](https://github.com/CaelmBleidd/symbolic_execution_2025/tree/c5a34b56a853bce2f8614dc02bf21dbc7d8f5998).

## Требования

- Go 1.23.2 или новее.
- C-компилятор и включённый cgo.
- Z3: библиотека и заголовочные файлы.

macOS:

```bash
brew install z3
export CGO_CFLAGS="-I$(brew --prefix z3)/include"
export CGO_LDFLAGS="-L$(brew --prefix z3)/lib"
```

Ubuntu/Debian:

```bash
sudo apt-get install build-essential libz3-dev
```

## Запуск

```bash
git clone https://github.com/CaelmBleidd/symbolic_execution_2026.git
cd symbolic_execution_2026
make deps
make build
make test
make examples
```

`make lint` запускает `go vet`, `make fmt` форматирует код, `make coverage` строит отчёт о покрытии.
Все команды доступны через `make help`.

## Структура

```text
examples/basic_z3_example.go   # Уравнения, модель и push/pop
pkg/z3wrapper/solver.go        # Обёртка над Z3
pkg/z3wrapper/solver_test.go   # Тесты обёртки
go.mod, go.sum                # Зависимости Go
Makefile                     # Сборка и проверки
```
