
# TruncatingDataBreach V2

The New Version written in [vlang](https://vlang.io/)

Truncate a data breach into two files.

### 1 000 000 lines in 2-3 seconds (i5-6500)
### 12 000 00 lines in 35 seconds (i5-6500)

This can then be used as two wordlists for a brute-force attack

## Usage
```bash
	-h for help
	-f for input file
	-p for password output file
	-u for user output file
	-s "" for the separator

	example :
	TruncatingDatabreach -f input.txt -p pass.txt -u user.txt -s ":;" 
```


Input example (this will be put into two files) : 
```bash
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
```

## How it works
- Written in vlang
- Define your input file, your two output files and the seperator with the parameters
- That's all. 

## To Do
- Add comments to code
- delete file content if rerun

## Author
- [@lurto](https://www.github.com/lurto)
