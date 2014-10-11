# Launch Checklist/Client Log

## Models

- Sites		
		* has_many tasks
		* has_one checklist

		server_name:string
		server_location:string
		ip:string
		repository:string
		domain:string
		dns:string
		email:string
		notes:text
		checklist_complete:boolean
		deployed:boolean

rails g scaffold Site server_name server_location ip repository domain dns email notes:text checklist_complete:boolean deployed:boolean

- Task
		belongs_to :site		
		has_one :checklist
		name
		responsible
		due:timestamp
		completed:boolean
		date_completed:timestamp
		site:references

rails g model Task name responsible due:timestamp date_completed:timestamp completed:boolean
rails g controller

- Checklist
		belongs_to site

		analytics:boolean
		permalinks:boolean
		contact_forms:boolean
		site_url:boolean
		allow_robots:boolean
		css_compressed:boolean
		javascript_compressed:boolean
		redirects:boolean
		google_site_map:boolean
		site:references

		rails g scaffold Checklist analytics:boolean permalinks:boolean contact_forms:boolean site_url:boolean allow_robots:boolean css_compressed:boolean javascript_compressed:boolean redirects:boolean google_site_map:boolean site:references

		 

Deploy List
	- need to add to this at any time
	- entire list belongs to any site
## Checklist

- Google Analytics installed
- Refresh Peramlinks ( WP )
- Contact Forms Ready
- Site Url correct
- Allow Robots
- Sass Compressed
- Javascript compressed
- 301 Redirects in place
- Site map submited to Google

DeployList

How to set a default checklist?
	- model specific to list
	- add questions to checklist
	- each site has checklist
	- set checklist to default on view, update with question params....would overwrite..
How to update checklist globally?
	- when site is viewed, checklist is synced with default checklist

## Features

- Searchable/Sortable list of sites
* Uptime checker
		ping check ruby
* Page speed check?
** Tabs: Notes, Checklist, Tasks, Details
*** Lock site from editing when someone else is editing

		# time way
		1. user clicks edit
		2. save current editing time
		3. if someone else trys to edit, check to see is updated_last == editing_time
		4. if not equal, denied access
		5. on user save, set editing_time == updated_last

		# simplest way
		1. on edit, set editing to true
		2. on save, set editing to false
		3. don't allow access to model with editing true



# Client/Website Log

custom application
	pros
		* checklist is with site
	cons
		* must maintain application can be very time consuming!

google docs
	pros
		* no need to maintain application
		* very high availability, Google never really goes down
	cons
		* no checklist with site - Other solutions such as a text file with the respository
		would be good enough. Where do we store the checklist?

VERDICT: Not worth it. Boohoo.
