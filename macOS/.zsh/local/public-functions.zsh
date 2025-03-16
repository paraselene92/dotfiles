function tfonly() {
 cat $1 | grep "^resource" | tr -d "\""| awk -F" " '{print "--target "$2"."$3}' | tr "\n" " "
}
