function wallreturn
  set WTJSON_FILE (string join "" $WTJSON_DIR "settings.json")
  set WTJSON_OLDFILE (string join "" $WTJSON_DIR "settings.json.old")

  mv -f $WTJSON_OLDFILE $WTJSON_FILE
end
