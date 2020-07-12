function wallchange
  set WTJSON_FILE (string join "" $WTJSON_DIR "settings.json")
  set WTJSON_OLDFILE (string join "" $WTJSON_DIR "settings.json.old")
  set WTJSON_TEMPFILE (string join "" $WTJSON_DIR "settings.json.temp")

  cp -rf $WTJSON_FILE $WTJSON_OLDFILE
  set filename (ls $WC_PIC_DIR | shuf -n 1)

  set wc_pic_dir_split (string split "/" $WC_PIC_DIR)
  # $wc_pic_dir_split[0],[1] = null
  # $wc_pic_dir_split[2] = mnt

  # aaa\\bbb\\ccc\\ddd
  set wc_pic_dir_win (for i in (seq 4 (count $wc_pic_dir_split))
    echo $wc_pic_dir_split[$i]
  end | string join "\\\\")

  # D:\\aaa\\bbb\\ccc\\ddd
  set wc_pic_dir_win (string join ":\\\\" (string upper $wc_pic_dir_split[3]) $wc_pic_dir_win)

  # D:\\aaa\\bbb\\ccc\\ddd\\eee.jpg
  set wc_pic_file_path_win (string join "" $wc_pic_dir_win "\\\\" $filename)

  set wc_pic_file_path_json (string join = .profiles[2].backgroundImage\| \"$wc_pic_file_path_win\")
  cat $WTJSON_TEMPFILE | jq $wc_pic_file_path_json > $WTJSON_FILE
end
