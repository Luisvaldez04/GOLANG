package main

import (
	"log"
	"net/http"

	"mi-api-golang/controllers"

	"github.com/gorilla/mux"
	_ "github.com/gorilla/mux"
)

func main() {

	/* logs cleaner docker logs --since 30s -f <container_name_or_id> */

	r := mux.NewRouter()

	r.HandleFunc("/clientes", controllers.GetClientes).Methods("GET")
	r.HandleFunc("/clientes/{id}", controllers.GetClienteById).Methods("GET")
	r.HandleFunc("/clientes", controllers.CreateCliente).Methods("POST")
	r.HandleFunc("/clientes/{id}", controllers.UpdateCliente).Methods("PUT")
	r.HandleFunc("/clientes/{id}", controllers.DeleteCliente).Methods("DELETE")

	log.Fatal(http.ListenAndServe(":5001", r))

	// router := mux.NewRouter().

}
