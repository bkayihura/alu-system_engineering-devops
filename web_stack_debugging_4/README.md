# Web Stack Debugging #4

## Task: Sky is the limit, let's bring that limit higher

This project fixes an Nginx server that fails to handle high traffic because its open file descriptor limit is too low.

## Problem

Running ApacheBench with 2,000 requests and 100 concurrent connections resulted in 660 failed requests.

The Nginx error log showed:

Too many open files (24)

The server's file descriptor limit was set to 15.

## Solution

The Puppet manifest `0-the_sky_is_the_limit_not.pp`:

- Changes the Nginx ULIMIT from 15 to 4096.
- Restarts Nginx when the configuration changes.
- Avoids unnecessary changes when the correct limit is already configured.

## Testing

Run the Puppet manifest:

    sudo puppet apply 0-the_sky_is_the_limit_not.pp

Run the benchmark:

    ab -c 100 -n 2000 http://127.0.0.1/

## Results

- Complete requests: 2000
- Failed requests: 0
- Nginx file descriptor limit: 4096
- Puppet syntax validation: Passed
- Puppet lint: Passed

## Environment

Ubuntu 14.04, Nginx 1.4.6, Puppet 3.4.3.
