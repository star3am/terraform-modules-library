#!/bin/bash -e

echo "Similate Pipeline"

echo "make format"
make format

echo "make lint"
make lint

echo "make tflint"
make tflint

echo "make init-all"
make init-all

echo "make validate"
make validate

echo "make clean"
make clean

echo "make docs"
make docs

echo "make tfsec"
make tfsec

echo "make plan-all"
make plan-all

echo "pre-commit run -a"
pre-commit run -a
