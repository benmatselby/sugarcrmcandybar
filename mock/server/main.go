package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Fprint(os.Stderr, "usage: main.go [rest version]\n")
		os.Exit(1)
	}

	restVersion := os.Args[1]
	http.HandleFunc(fmt.Sprintf("/rest/%s/oauth2/token", restVersion), oauthHandler)
	http.HandleFunc(fmt.Sprintf("/rest/%s/me", restVersion), meHandler)
	http.HandleFunc(fmt.Sprintf("/rest/%s/globalsearch", restVersion), globalSearchHandler)

	log.Fatal(http.ListenAndServe(":8080", nil))
}

func oauthHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("Hit the oauth handler %v\n", r.RequestURI)
	response := `{
	"access_token": "d34dddec-efdf-40a7-b569-8b1246d61096"
}`
	fmt.Fprintln(w, response)
}

func meHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("Hit the me handler %v\n", r.RequestURI)
	response := `{
	"current_user": {
		"id": "5aa9995e-9f76-429f-b9a2-7d872fef442c"
	}
}`
	fmt.Fprintln(w, response)
}

func globalSearchHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("Hit the search handler %v\n", r.RequestURI)
	response := `{
	"records": [
		{
			"id": "e5f7c1de-c46a-4c90-9eab-412162629305",
			"name": "Don't Call Shirly",
			"description": "You can't be serious?",
			"_module": "Calls",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "cb9750b8-cd6d-41f1-9037-ad1f3704da88",
			"name": "Bridge over troubled water",
			"description": "I'm on your side",
			"_module": "Cases",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "fe9dc051-a3cc-40f2-8605-4ef638edec13",
			"name": "Saul Goodman",
			"description": "Better call Saul",
			"_module": "Contacts",
			"first_name": "Saul",
			"last_name": "Goodman",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "076e6e0e-387e-4ded-bb69-5c12b8110fde",
			"name": "Magna Carter",
			"document_name": "Magna Carter",
			"description": "Great power, great responsibility",
			"_module": "Documents",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "f29b33a7-06de-40c2-a0b5-224b1d0f5a15",
			"name": "There are cakes in the canteen",
			"description": "Emails are fun aren't they",
			"_module": "Emails",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "981f83b7-23c7-46c4-8912-06914d1397ad",
			"name": "Richard Kimble",
			"description": "It wasn't me, it was the one armed man",
			"_module": "Leads",
			"first_name": "Richard",
			"last_name": "Kimble",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "9b77a26a-d969-4f57-a1f7-4e733d53b861",
			"name": "Note: He likes it shaken, not stirred",
			"description": "Please make sure barman gets this during the poker game",
			"_module": "Notes",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "a7f59846-ffe2-477b-b98b-45cc8255fad1",
			"name": "Blonde On Blonde by Bob Dylan",
			"description": "The post office has been stolen, and the mailbox is locked",
			"_module": "RevenueLineItems",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
		{
			"id": "70372332-8336-400a-b7ab-7505d09bb1bf",
			"name": "Your mission, should you choose to accept it...",
			"description": "It's not mission difficult Mr Hunt, it's Mission Impossible. Difficult should be a walk in the park",
			"_module": "Tasks",
			"date_modified": "2018-10-09T13:02:59+01:00",
			"modified_user_id": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
			"created_by": "b30e9fbf-6a69-4525-9e8a-16cb4f832da9",
		},
	]
}`
	fmt.Fprintln(w, response)
}
