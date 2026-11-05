postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root kansas_bank

dropdb:
	docker exec -it postgres12 dropdb kansas_bank

migrateup:
	migrate -path ./Database-Migration -database "postgresql://root:secret@localhost:5432/kansas_bank?sslmode=disable" -verbose up

migrateup1:
	migrate -path ./Database-Migration -database "postgresql://root:secret@localhost:5432/kansas_bank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path Database-Migration -database "postgresql://root:secret@localhost:5432/kansas_bank?sslmode=disable" -verbose down

migratedown1:
	migrate -path Database-Migration -database "postgresql://root:secret@localhost:5432/kansas_bank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate -f ../sqlc.yaml

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination sqlc/mock/store.go github.com/zoeshortman/KansasFirstBank/Database-Migration/sqlc Store

.PHONY: postgres createdb dropdb migrateup migratedown migrateup1 migratedown1 sqlc server mock
