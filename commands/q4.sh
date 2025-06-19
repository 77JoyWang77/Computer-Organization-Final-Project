#!/bin/bash

# Configs
source config.sh

# origin-policy
${COMMANDS_PATH}q4-origin-policy.sh

# frequency-based-policy
${COMMANDS_PATH}q4-frequency-based-policy.sh
