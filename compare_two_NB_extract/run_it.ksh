mysql --skip-column-names -uadmin -ppassword srgp < ./database/sql/compare_two_nationbuiler_members_export.sql > kk
cat kk | sed -f no_spaces_sed > ss
rm kk
# ss is the file with the MODS in it

