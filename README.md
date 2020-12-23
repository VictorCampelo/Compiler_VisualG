# Compiler_VisualG
Construction of a compiler for the VisualG language as a requirement for the discipline of Compilers - UFPI

## Depedences instalation
### Antlr4 for Python:
```sh
pip3 install antlr4-python3-runtime
```
### or
```sh
pip install antlr4-python3-runtime
```
### Maybe for install the dependencies above it's necessary install the nexts tools
```sh
pip3 install setuptools
pip3 install wheel
```
### or
```sh
pip install setuptools
pip install wheel
```

## How to run:
### Inside of project's directory run the follows commands:
### Change the file extension at "nomearquivo.jav".
```sh
antlr4 -Dlanguage=Python3 Hello.g4
python3 main.py nomearquivo.jav
```
