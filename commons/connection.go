package commons

import (
	"database/sql"
	_ "time"

	_ "github.com/go-sql-driver/mysql"
)

func GetConnection() (*sql.DB, error) {
	return sql.Open("mysql", "luis:2171906@tcp(db:3306)/golangdb")
}
