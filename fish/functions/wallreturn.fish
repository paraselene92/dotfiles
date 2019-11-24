function wallreturn
  set WTJSON "/mnt/c/Users/paraselene92/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json"
  set WTJSON_OLD "/mnt/c/Users/paraselene92/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json.old"
  mv -f $WTJSON_OLD $WTJSON
end
