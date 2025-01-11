{
  lib,
  python3Packages,
}: let
  inherit (python3Packages) buildPythonPackage fetchPypi;
in
  buildPythonPackage rec {
    pname = "jupyterlab_vpython";
    version = "3.1.8";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-/Q8d0IaBwiRFvEVPGcxkuIkK1ZhAH5d5nPNlXzIEKCU=";
    };

    pyproject = true;
    build-system = with python3Packages; [
      jupyter
      hatchling
      hatch-jupyter-builder
      hatch-nodejs-version
    ];

    meta = {
      changelog = "https://github.com/jcoady/jupyterlab_vpython/blob/main/CHANGELOG.md";
      description = "VPython extension for JupyterLab";
      homepage = "https://github.com/jcoady/jupyterlab_vpython";
      license = lib.licenses.bsd3;
    };
  }
