{ clangStdenv
, nodejs
, fetchgit
, pkgs
, lib
,
}:
clangStdenv.mkDerivation rec {
  name = "cdt";
  version = "4.0.0";
  buildInputs = with pkgs; [
    llvm
    curl.dev
    gmp.dev
    openssl.dev
    libusb1.dev
    bzip2.dev
    (boost.override
      {
        enableShared = false;
        enabledStatic = true;
      })
  ];

  dontFixCmake = true;
  nativeBuildInputs = with pkgs; [ pkgconfig cmake clang git python3 ];

  src = fetchgit {
    url = "https://github.com/AntelopeIO/cdt";
    rev = "v${version}";
    sha256 = "sha256-yZpTj3MlWYDw3Se7ZwwvNnqB4XpdPVqHWY2hK18KIIU=";
  };
}
