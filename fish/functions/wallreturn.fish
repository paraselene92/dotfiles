function wallreturn
  set USERNAME "paraselene92" 
  set PIC_DIR "/mnt/d/two_dimention"
  set WTJSON_DIR "/mnt/c/Users/$USERNAME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/"

  set WTJSON_FILE (string join "" $WTJSON_DIR "profiles.json")
  set WTJSON_OLDFILE (string join "" $WTJSON_DIR "profiles.json.old")

  mv -f $WTJSON_OLDFILE $WTJSON_FILE
end
