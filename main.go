package main

import (
	"context"
	"fmt"
	"time"
)

func main() {
	ctx := context.Background()
	ticker := time.NewTicker(time.Second * 3)

	go func() {
		for {
			select {
			case <-ctx.Done():
				fmt.Println("Context closed")
				return
			case t := <-ticker.C:
				fmt.Println("Tick at", t)
			}
		}
	}()

	select {}
}
