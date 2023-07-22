#!/bin/bash -e

echo "Similate Pipeline"

echo "pre-commit run -a"
pre-commit run -a

echo "make lint"
make lint

echo "make tflint"
make tflint

echo "make format"
make format

echo "make validate"
make validate

echo "make clean"
make clean

echo "make docs"
make docs

echo "make plan-all"
make plan-all

echo "pre-commit run -a"
pre-commit run -a
