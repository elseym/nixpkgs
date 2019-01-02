{ stdenv, buildPythonPackage, fetchPypi, cffi}:

buildPythonPackage rec {
  pname = "cffi_utils";
  version = "0.79";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0b1a0y75xjln9smrc9rljhdwcq9r6pzg45wsgkq8l59vw62np65h";
  };

  propagatedBuildInputs = [ cffi ];

  meta = with stdenv.lib; {
    description = "Utility modules to build python wrappers around C code";
    homepage = https://github.com/stianaske/pybotvac;
    license = licenses.gpl3;
    maintainers = with maintainers; [ elseym ];
  };
}
