#!/bin/sh

trap 'mysqladmin -u root -ppass shutdown' EXIT

mysqld_safe
