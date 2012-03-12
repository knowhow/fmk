./make_pkg.sh

PKG_VER=`git describe --tags --abbrev=0`

mv package/fmk.gz f18_db_migrate_package_$PKG_VER.gz

ls -l f18_db_migrate_package_$PKG_VER.gz




