# Web Stack Debugging #3

## Strace Is Your Friend

This project uses strace to investigate an HTTP 500 error on a WordPress website running Apache and PHP.

## Problem
WordPress attempted to load class-wp-locale.phpp instead of class-wp-locale.php.

## Solution
A Puppet manifest fixes the incorrect filename in wp-settings.php.

## File
- 0-strace_is_your_friend.pp
