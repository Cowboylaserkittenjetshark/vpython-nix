{
  lib,
  python3Packages,
  simpervisor,
}: let
  inherit (python3Packages) buildPythonPackage fetchPypi;
  dependencies = with python3Packages; [
    aiohttp
    importlib-metadata
    jupyter-server
    simpervisor
    tornado
    traitlets
  ];
in
  buildPythonPackage rec {
    pname = "jupyter_server_proxy";
    version = "4.4.0";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-5XMuucgQwMqpl/kKLxX30Jr2OOfuqcZ+tcQ+nB8OEVc=";
    };

    pyproject = true;
    build-system = with python3Packages; [
      jupyter
      hatchling
      hatch-jupyter-builder
    ] ++ dependencies;

    inherit dependencies;

    meta = {
      changelog = "https://jupyter-server-proxy.readthedocs.io/en/latest/changelog.html";
      description = "Jupyter notebook server extension to proxy web services";
      homepage = "https://github.com/jupyterhub/jupyter-server-proxy";
      license = lib.licenses.bsd3;
    };
  }
