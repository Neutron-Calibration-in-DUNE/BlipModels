#!/bin/bash

cd /workspace

create_ml_template -module_directory='/local_scratch/' -module_name='perlmutter_test'
blip /local_scratch/PerlmutterTest/perlmutter_test.yaml