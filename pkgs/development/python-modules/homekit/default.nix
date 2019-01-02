{ stdenv, buildPythonPackage, fetchPypi
, zeroconf, gmpy2, py25519, hkdf, ed25519 }:

buildPythonPackage rec {
  pname = "homekit";
  version = "0.12.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0yfypamsnr2c76pjvyzlhj072vc5bfx50ag66fzhvags8309v954";
  };

  propagatedBuildInputs = [ zeroconf gmpy2 py25519 hkdf ed25519 ];

  meta = with stdenv.lib; {
    description = "A python implementation to work as both HomeKit controller and accessory.";
    homepage = https://github.com/jlusiardi/homekit_python;
    license = licenses.asl20;
    maintainers = with maintainers; [ elseym ];
  };
}
