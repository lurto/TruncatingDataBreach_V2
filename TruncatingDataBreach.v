//module import
import os //for file operations
import term //for terminal output customization

params := (os.args) //passed parameters

if params.len == 1 { //no passed parameters
	//shown message
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
}else if params.any(it == '-h'){ //if the -h parameter is passed
	//shown message
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
} else if params.any(it == '-f') && params.any(it == '-p') && params.any(it == '-u') && params.any(it == '-s'){ // if all parameters are passed
	
	//all paramters put in variables
	input_file_path := params[params.index('-f') + 1]
	pass_file_path := params[params.index('-p') + 1]
	user_file_path := params[params.index('-u') + 1]
	separator := params[params.index('-s') + 1]

	//delete output files
	os.rm(user_file_path) or {}
	os.rm(pass_file_path) or {}

	//read lines of the input file
	lines := os.read_lines(input_file_path) or {panic(err)}
	//file descriptor opened for writting
	mut password_file := os.open_append(pass_file_path) or {panic(err)}
	mut user_file := os.open_append(user_file_path) or {panic(err)}

	//foreach loop for all lines
	for  line in lines {
		//line separated into two by the selected separator
		//both parts put into an array
		temp_line := line.split(separator)

		//writing each part of the array into the right file + new line 
		user_file.write_string(temp_line[0] + "\r\n") or {panic(err)}
		password_file.write_string(temp_line[1] + "\r\n") or {panic(err)}
		
	}
	//closing the file descriptor
	password_file.close()
	user_file.close()

	//end message
	println(term.cyan("All finished, check " + user_file_path + " and " + pass_file_path))

}else{ //if a parameter is missing
	//warn message
	println(term.warn_message("a parameter is missing, you need -f, -p, -u and -s"))
	println(term.warn_message("use -h for an example"))
}

