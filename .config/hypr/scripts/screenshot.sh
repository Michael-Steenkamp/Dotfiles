#!/bin/bash

# 1. grim (screenshot) + slurp (select region)
# 2. Pipe image data to swappy (editor) from stdin (-)
grim -g "$(slurp)" - | swappy -f -
