#! /bin/bash

gcloud compute instances create reddit-full-puma --boot-disk-size=10GB --image-family reddit-full --image-project=infra-219614 --machine-type=g1-small --tags reddit-full-puma --restart-on-failure --tags=default,reddit-base,reddit-full --zone=europe-west1-b
