package main

import (
	"os"
	"fmt"
	"strings"
	"strconv"
)

func main() {
	tot := 0
	a := -1
	b := 0
	f, err := os.ReadFile("input")
	if err != nil {
		fmt.Println("cant read file")
	}
	lines := strings.Split(string(f), "\n")
	for _, l := range lines {
		a = -1
		for _, c := range l {
			//fmt.Println(string(c))
			char, err := strconv.Atoi(string(c))
			if err == nil {
				if a < 0 {
					a = char
					b = char
				} else {
					b = char
				}
			}
		}
		fmt.Println(a, b)
		num := strconv.Itoa(a) + strconv.Itoa(b)
		fmt.Println("NUM", num)
		num = strings.ReplaceAll(num, " ", "")
		sub, _ := strconv.Atoi(num)
		tot += sub
	}
	fmt.Println(tot)
}
