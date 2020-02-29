function wallpicopen
  set USERNAME "paraselene92"
  set PIC_DIR "/mnt/d/two_dimention"
  set WTJSON_DIR "/mnt/c/Users/$USERNAME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/"

  set WTJSON_FILE (string join "" $WTJSON_DIR "profiles.json")
  set pic_path (cat $WTJSON_FILE | jq -r .profiles[2].backgroundImage)
  set pic_path (string replace -a \\\\ \\ $pic_path)

  explorer.exe $pic_path
end
