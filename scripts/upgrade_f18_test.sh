./make_pkg.sh

knowhowERP_package_updater -databaseURL=PSQL7://localhost:5432/f18_test -username=admin -passwd=admin -debug -file=package/fmk.gz -autorun
