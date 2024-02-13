# nginx-ocsp
nginx OCSP stapling (Must-Staple) workaround


It is a [known issue](https://trac.nginx.org/nginx/ticket/812) that nginx does not play well with OCSP Stapling, and this probably [will not change](https://trac.nginx.org/nginx/ticket/990).

Until I get around to switching or writing a patch, this is a workaround.

This is a systemd service that binds to the nginx service that, when nginx starts/restarts, attempts a TLS connection which forces nginx to actually retrieve the stapling.


This code is released under the [MIT license](https://github.com/samuel-jimenez/nginx-ocsp/tree/master/LICENSE).

## Installation

`install.sh` will move the files to the default systemd directory

## Using

Enable service, passing the name of your server, e.g. for `example.com`:
`systemctl enable --now nginx-ocsp@example.com`

## Setting up a dev environment

This assumes you have a certificate and have enabled stapling for your server with the following config directives:

	ssl_stapling on;
	ssl_stapling_verify on;
