function wt_environment
  set WTJSON_FILE (string join "" $WTJSON_DIR "settings.json")
  set WTJSON_OLDFILE (string join "" $WTJSON_DIR "settings.json.old")
  set WTJSON_TEMPFILE (string join "" $WTJSON_DIR "settings.json.temp")
end