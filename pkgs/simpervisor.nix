{
  lib,
  python3Packages,
}: let
  inherit (python3Packages) buildPythonPackage fetchPypi;
in
  buildPythonPackage rec {
    pname = "simpervisor";
    version = "1.0.0";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-frh8qG1eJ2l29bsCkJdaBdRSxqe39YBi2up9g2nII8E=";
    };

    pyproject = true;
    build-system = [python3Packages.hatchling];

    meta = {
      changelog = "https://github.com/jupyterhub/simpervisor/blob/main/CHANGELOG.md";
      description = "Simple async process supervisor";
      homepage = "https://github.com/jupyterhub/simpervisor";
      license = lib.licenses.bsd3;
    };
  }
