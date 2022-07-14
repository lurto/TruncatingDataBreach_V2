import os

params := (os.args)

if params.len == 1 {
	println('
	-h for help
	-f for input file
	-p for password output file
	-u for user output file
	-s "" for the separator
	-n  for the numbe of separators

	example :
	TruncatingDatabreach -f input.txt -p pass.txt -u user.txt -s ":;" 
		')
}else if params.any(it == '-h'){
	println('
	-h for help
	-f for input file
	-p for password output file
	-u for user output file
	-s "" for the separator
	-n  for the numbe of separators

	example :
	TruncatingDatabreach -f input.txt -p pass.txt -u user.txt -s ":;" 
		')
} else if params.any(it == '-f') && params.any(it == '-p') && params.any(it == '-u') && params.any(it == '-s'){
	input_file_path := params[params.index('-f') + 1]
	pass_file_path := params[params.index('-p') + 1]
	user_file_path := params[params.index('-u') + 1]
	separator := params[params.index('-s') + 1]

	lines := os.read_lines(input_file_path) or {panic(err)}
	mut password_file := os.open_append(pass_file_path) or {panic(err)}
	mut user_file := os.open_append(user_file_path) or {panic(err)}

	for  line in lines {
		temp_line := line.split(separator)

		password_file.write_string(temp_line[1] + "\r\n") or {panic(err)}
		user_file.write_string(temp_line[0] + "\r\n") or {panic(err)}
	}
	password_file.close()

	println("All finished, check " + user_file_path + " and " + pass_file_path)

}else{
	println("a paramter is missing, you need -f, -p, -u and -s")
	println("use -h for an example")
}



