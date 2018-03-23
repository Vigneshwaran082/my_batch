@echo off
set source_dir=%1
set dest_dir=%2
set do_override=%3


if [%do_override%]==[] (
 copy %source_dir% %dest_dir% /-Y ) else (
 copy %source_dir% %dest_dir% /Y)
