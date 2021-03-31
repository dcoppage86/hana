# HANA

Hana is a simple project managemant application that allows a user to create projects, where they can add tasks to be assigned for completion. It allows you to take out the stress of laminated lists and dry erase boards for daily job duties.

## Install

### Clone the repository

```shell
git clone https://github.com/dcoppage86/hana.git
cd hana
```

### Check your Ruby version

```shell
ruby -v
```

### Install dependencies


```shell
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate
```

## Server

```shell
rails s
```
Navigate to 
```shell
http://localhost:3000
```

## License
[MIT](https://choosealicense.com/licenses/mit/)