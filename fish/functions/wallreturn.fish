function wallreturn
  set WTJSON_FILE (string join "" $WTJSON_DIR "profiles.json")
  set WTJSON_OLDFILE (string join "" $WTJSON_DIR "profiles.json.old")

  mv -f $WTJSON_OLDFILE $WTJSON_FILE
end
