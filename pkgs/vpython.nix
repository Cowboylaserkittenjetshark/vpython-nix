{
  lib,
  python3Packages,
  jupyterlab-vpython,
  jupyter-server-proxy,
}: let
  inherit (python3Packages) buildPythonPackage fetchPypi;
  dependencies = with python3Packages; [
    jupyter
    jupyter-server-proxy
    jupyterlab-vpython
    notebook
    numpy
    ipykernel
    autobahn
  ];
in
  buildPythonPackage rec {
    pname = "vpython";
    version = "7.6.5";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-JtD+TE8lPDalcK3jkkzuJCOy/rXmCC/11fLqwJPnRt8=";
    };

    pyproject = true;
    build-system = with python3Packages;
      [
        setuptools-scm
        cython
      ]
      ++ dependencies;

    inherit dependencies;

    meta = {
      changelog = "https://github.com/vpython/vpython-jupyter/releases/tag/${version}";
      description = "VPython for Jupyter Notebook";
      homepage = "https://github.com/vpython/vpython-jupyter";
      license = lib.licenses.mit;
    };
  }
