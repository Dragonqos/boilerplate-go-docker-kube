package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		json.NewEncoder(writer).Encode(map[string]interface{}{"ok": true, "name": "service main is running ok"})
	})

	srv := &http.Server{
		Handler: r,
		Addr:    os.Getenv("APP_PORT"),
		// Good practice: enforce timeouts for servers you create!
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	fmt.Printf("Listening on port %v", os.Getenv("APP_PORT"))
	log.Fatal(srv.ListenAndServe())
}
