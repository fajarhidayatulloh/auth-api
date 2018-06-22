# Auth API

Auth API.

## Quick Start

- Clone this repo or download it's release archive and extract it somewhere
- You may delete `.git` folder if you get this code via `git clone`
- Run `composer update` or `composer install`
- Copy `.env.example` to `.env` for Configure your `.env` file.
- Chmod 777 `Storage`
- Well Done. 

## A Live PoC

- Run a PHP built in server from your root project:

```sh
php artisan serve
```

To authenticate a user, make a `POST` request to `{{url}}/api/v1/oauth/token` with parameter as mentioned below:

```
grant_type: password
client_id: 5
client_secret: uTgO6COI3XmB1zr2tr3VWgjP5nJlLShG0iDJwY0H
username: fajar@bareksa.com
password: 12345678
scope: *
```

Response:

```
{
  "success": {
    "token_type": "Bearer",
    "expires_in": "time",
    "access_token": "a_long_access_token_appears_here",
    "refresh_token": "a_long_refresh_token_appears_here"
  }
}
```

