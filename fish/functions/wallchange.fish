function wallchange
  set WTJSON "/mnt/c/Users/paraselene92/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json"
  set WTJSON_OLD "/mnt/c/Users/paraselene92/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json.old"
  cp -rf $WTJSON $WTJSON_OLD
  set filename (ls /mnt/d/two_dimention | shuf -n 1)
  set filepath (string join = .profiles[2].backgroundImage\| \"D:\\\\two_dimention\\\\$filename\")
  cat $WTJSON | jq $filepath > $WTJSON
end
