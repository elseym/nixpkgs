{ stdenv, buildPythonPackage, fetchPypi, cffi_utils }:

buildPythonPackage rec {
  pname = "py25519";
  version = "0.13.28";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0marrs2p0lcv8r5gzf41skq12q7rw1hwccykwdcn7in7pbc9gaz6";
  };

  postPatch = ''
    substituteInPlace c/Rules.mk \
      --replace '-static' '-static -L${stdenv.glibc.static}/lib'
  '';

  propagatedBuildInputs = [ cffi_utils ];

  meta = with stdenv.lib; {
    description = "Python wrappers around Ed25519: high-speed high-security signatures by Daniel J. Bernstein";
    homepage = https://github.com/sundarnagarajan/py25519;
    license = licenses.gpl3;
    maintainers = with maintainers; [ elseym ];
  };
}
