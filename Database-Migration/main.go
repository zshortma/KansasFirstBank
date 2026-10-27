package main

import (
	"database/sql"
	"log"

	db "github.com/KansasFirstBank/Database-Migration/sqlc"
	"github.com/KansasFirstBank/api"
	"github.com/KansasFirstBank/util"
	_ "github.com/lib/pq"
)

func main() {
	config, err := util.LoadConfig("./Database-Migration")
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}
	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}
