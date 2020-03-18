#!/bin/bash

mkdir -p /home/ldhelmet/LDhelmet_v1.10/output &&
time /home/ldhelmet/LDhelmet_v1.10/ldhelmet post_to_text -m -p 0.025 -p 0.50 -p 0.975 -o /home/ldhelmet/LDhelmet_v1.10/output/output.txt /home/ldhelmet/LDhelmet_v1.10/output/output.post
