{ stdenv, buildPythonPackage, fetchPypi, aiohttp }:

buildPythonPackage rec {
  pname = "pydeconz";
  version = "64";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1clfajpr88j4368xp3py7jsx0306k73hbn9w38di6v2y5h9b2r3z";
  };

  propagatedBuildInputs = [ aiohttp ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Python library wrapping deconz rest api for home-assistant";
    homepage = https://github.com/Kane610/deconz;
    license = licenses.mit;
    maintainers = with maintainers; [ elseym ];
  };
}
