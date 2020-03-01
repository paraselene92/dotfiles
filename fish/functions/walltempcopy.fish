function walltempcopy
  set WTJSON_FILE (string join "" $WTJSON_DIR "profiles.json")
  set WTJSON_TEMPFILE (string join "" $WTJSON_DIR "profiles.json.temp")

  cp -rf $WTJSON_FILE $WTJSON_TEMPFILE
end
