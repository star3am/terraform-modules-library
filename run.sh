#!/bin/bash -e

echo "Simulate Pipeline"

echo "pre-commit run -a"
pre-commit run -a

echo "make clean"
make clean

echo "make init-all"
make init-all

# echo "make tfsec"
# make tfsec

# echo "make checkov"
# make checkov

echo "make format"
make format

echo "make lint"
make lint

echo "make tflint"
make tflint

echo "make validate"
make validate

echo "make docs"
make docs

# echo "make plan-all"
# make plan-all
