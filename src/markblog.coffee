###
                                         _   _    _            
                                        | | | |  | |           
                  _  _  _    __,   ,_   | | | |  | |  __   __, 
                 / |/ |/ |  /  |  /  |  |/_)|/ \_|/  /  \_/  | 
                   |  |  |_/\_/|_/   |_/| \_/\_/ |__/\__/ \_/|/
                                                            /| 
                                                            \| 

The MIT License (MIT)

Copyright (c) 2014 Leonardo Kewitz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
###

fs = require 'fs'
path = require 'path'
markdown = require('markdown').markdown

Markblog =
	# Compile Post
	compile: (string) ->
		parse = string.match /(?:---\ntitle: )(.*)(?:\ndate: )(.*)(?:\n---\n\n)([^]*)/
		post =
			title: parse[1]
			date: new Date parse[2]
			body: 
				html: markdown.toHTML parse[3]
				markdown: parse[3]

	# Read Markdown file.
	read: (file) ->
		return file + " does not exist." unless fs.existsSync file
		stat = fs.statSync file
		return file + " is not a file." unless stat.isFile()
		
		md = fs.readFileSync(file).toString()
		post = @compile md

	# Return all posts compiled.
	readFolder: (folder) ->
		files = (path.join folder, file for file in fs.readdirSync folder)
		(@read file for file in files when file.match /\.md/)

module.exports = Markblog