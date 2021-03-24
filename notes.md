<!-- HANA -->

<!-- ## ::Tables:: -->

<!-- # User: -->
<!-- 
	first_name
	last_name
	Email
	Password

Project:

	Name

Task:

	project_id
	Name
	status

User_Project

	user_id
	project_id

::Models::

User:

	has_many :user_projects
	has_many :projects, through: :user_projects

Projects:
 
	has_many :tasks
	has_many :user_projects
	has_many :users, through: :user_projects

Tasks:

	belongs_to :project

User_Projects:

	belongs_to :user
	belongs_to :projects -->