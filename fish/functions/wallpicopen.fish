function wallpicopen
  set WTJSON_FILE (string join "" $WTJSON_DIR "profiles.json")
  set pic_path (cat $WTJSON_FILE | jq -r .profiles[2].backgroundImage)
  set pic_path (string replace -a \\\\ \\ $pic_path)

  explorer.exe $pic_path
end
