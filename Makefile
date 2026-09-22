GO ?= go

.PHONY: all build test examples deps lint fmt coverage clean help

all: build test ## Сборка и тесты

build: ## Сборка всех пакетов
	$(GO) build ./...

test: ## Запуск тестов
	$(GO) test -v ./...

examples: ## Запуск примера работы с Z3
	$(GO) run ./examples/basic_z3_example.go

deps: ## Загрузка зависимостей Go
	$(GO) mod download

lint: ## Проверка go vet без изменения файлов
	$(GO) vet ./...

fmt: ## Форматирование Go-кода
	$(GO) fmt ./...

coverage: ## Отчёт о покрытии тестами
	$(GO) test -coverprofile=coverage.out ./...
	$(GO) tool cover -html=coverage.out -o coverage.html

clean: ## Очистка результатов сборки и покрытия
	$(GO) clean ./...
	$(RM) coverage.out coverage.html

help: ## Список команд
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  %-12s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
