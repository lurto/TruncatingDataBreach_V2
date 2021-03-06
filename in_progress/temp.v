import os
import term

fn write_file(path string, params []string, index int) {

	input_file_path := params[params.index('-f') + 1]
	separator := params[params.index('-s') + 1]

	lines := os.read_lines(input_file_path) or {panic(err)}
	mut file := os.open_append(path) or {panic(err)}
	
	for  line in lines {
		temp_line := line.split(separator)
		file.write_string(temp_line[index] + "\r\n") or {panic(err)}

	}
	file.close()

}

fn main() {
	params := (os.args)

	if params.len == 1 {
		println(term.cyan('
		-h for help
		-f for input file
		-p for password output file
		-u for user output file
		-s "" for the separator
		-n  for the numbe of separators

		example :
		TruncatingDatabreach -f input.txt -p pass.txt -u user.txt -s ":;" 
			'))
	}else if params.any(it == '-h'){
		println(term.cyan('
		-h for help
		-f for input file
		-p for password output file
		-u for user output file
		-s "" for the separator
		-n  for the numbe of separators
		
		example :
		TruncatingDatabreach -f input.txt -p pass.txt -u user.txt -s ":;" 
			'))
	} else if params.any(it == '-f') && params.any(it == '-p') && params.any(it == '-u') && params.any(it == '-s'){
		
		mut threads := []thread{}
		pass_file_path := params[params.index('-p') + 1]
		user_file_path := params[params.index('-u') + 1]

		os.rm(user_file_path) or {}
		os.rm(pass_file_path) or {}

		threads << go write_file(user_file_path, params, 0)
		threads << go write_file(pass_file_path, params, 1)
		
		threads.wait()
		

		println(term.cyan("All finished, check " + user_file_path + " and " + pass_file_path))

	}else{
		println(term.warn_message("a paramter is missing, you need -f, -p, -u and -s"))
		println(term.warn_message("use -h for an example"))
	}
}
